my $c=0;
use Data::Dumper;

#set_stdout(Dumper(config()));

for my $i (@{config()->{list}}){
  $c++;
  run_story("get-acl", { path => $i->{path}, output =>  cache_dir()."/$c.json" } )
}

run_story("check-acl",{  basedir => cache_dir() } );
