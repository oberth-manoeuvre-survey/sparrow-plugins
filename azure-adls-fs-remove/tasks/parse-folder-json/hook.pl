use JSON;

my $basedir = task_var("basedir");
my $c = task_var("c");
my $dir = task_var("dir");
my $dry_run = config()->{dry_run};
my $skip = config()->{skip};

my $remove_dir = config()->{remove_dir};

my $file = "$basedir/$c.json";

open(my $fh, $file) or die "$!";

my $s = join "", <$fh>;

close $fh;

unlink $file;

my $data = decode_json($s);

for my $i (@$data) {


  if ($i->{"type"} eq "DIRECTORY"){

    if ($skip){

      set_stdout("skip dir $i->{name}");
      next if $i->{name} =~ /$skip/;

    }

    $c++;

    set_stdout("add dir $i->{name}");

    run_task("read-folder", { basedir =>  $basedir, path => $i->{name}, c => $c });    

    run_task("parse-folder-json", { basedir =>  $basedir, c => $c, dir => $i->{"name"}, remove_dir => 1  });
  
  }

  if ($i->{"type"} eq "FILE"){

    if ($dry_run) {

      set_stdout("would remove file $i->{name}");

    } else {

      run_task("remove-fs", { path => $i->{name}, ignore_errors => 1 });

    }


  }

}

if ($dry_run) {

  set_stdout("would remove folder $i->{name}");

} else {

  run_task("remove-fs", { path => $dir , ignore_errors => 1 }) unless $remove_dir;

}


