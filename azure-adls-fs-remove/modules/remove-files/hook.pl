my $state = get_state();

for my $f (reverse sort @{$state->{files}}) {

  run_story("remove-fs", { path => $f });

}
