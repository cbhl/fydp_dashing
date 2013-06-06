require 'octokit'

SCHEDULER.every '10m', :first_in => 0 do |job|
  repos = ["zmanji/ecryptfs", "zmanji/ecryptfs_userspace"]

  commits = repos.map do |repo|
      {
          name: repo,
          latest_commit: Octokit.commits(repo, nil, options={:per_page => 1})[0],
      }
  end

  result = commits.map do |repo|
      { label: repo[:name], value: repo[:latest_commit].sha[0..7] }
  end

  send_event('last-commit', {items: result})
end
