use JSON::Tiny;

my %data = from-json("{cache_root_dir()}/branch.json".IO.slurp);

my $branch = config()<branch>;

my $branch-found = False;
my $branch-obj;

for %data<value><> -> $i {
  if $i<name> eq "refs/heads/$branch" {
    $branch-obj = $i;
    $branch-found = True;
    last
  }
}

set_stdout("branch object ID: {$branch-obj<objectId>||'NA'}");

if $branch-found {

  run_task "delete-branch-api", %(
    object_id => $branch-obj<objectId>
  );

  set_stdout("branch found");

} else {

  set_stdout(%data<message>);

}
