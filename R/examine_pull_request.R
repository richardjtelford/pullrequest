#' Examine pull request
#' @param user GitHub user name
#' @param repo GitHub repo name (the name of the fork if this differs from the name of the original repo)
#' @param branch name of branch to examine - this will be given in pull request text 
#' @param default_branch name of default branch (probably main or master)

#' @importFrom git2r remotes remote_add fetch branches branch_target branch_create checkout lookup
#' @importFrom glue glue
#' @examples
#' #examine_pull_request(user = "audhalbritter", repo = "biostats", branch = "FixGitTutorial") 
#' @export

examine_pull_request <- function(user, repo, branch, default_branch = "main"){
  
  #add remote - only needs doing once per fork
  if(!user %in% remotes()){
    remote_add(
      name = user, 
      url = glue("https://github.com/{user}/{repo}biostats.git")
    )
  }
  
  # run every update
  checkout(branch = default_branch)
  fetch(name = user)
  b <- branches(flags = "remote")
  b <- b[[glue("{user}/{branch}")]]
  sha <- branch_target(b)
  branch_create(commit = lookup(sha = sha), name = glue("{user}-{branch}"), force = TRUE)
  checkout(object = ".", branch = glue("{user}-{branch}"))
}

# #to view again after updates (probably is a  better solution)
# #return to master branch
# checkout(branch = "master")
# #delete pull request branch
# git2r::branch_delete(branch = "audhalbritter-FixGitTutorial")


