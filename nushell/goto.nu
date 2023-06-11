# Search your workspaces for a project with a given name and `cd` to it.
export def-env main [project: string@project_names] {
  let projects = (get_projects)
  let project_path = ($projects | where basename == $project | get name)
  if (($project_path | length) == 1) {
    cd $project_path.0
  } else {
    print $"Project ($project) not found"
  }
}

def project_names [] {
  get_projects | get basename
}

def get_projects [] {
  let combined_ls = (list_multiple_projects (workspace_folders));
  $combined_ls | where type == "dir" | select name | insert basename {|row| ($row.name | split row "/" | last) }
}

def list_multiple_projects [
  folders: list<string>
] {
  $folders | reduce -f [] {|it, acc| $acc | append (ls $it)}
}

def workspace_folders [] {[
  "~/workspace",
  "~/workspace/cultureamp"
]}
