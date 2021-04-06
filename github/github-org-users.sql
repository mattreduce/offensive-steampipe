select
  u.login,
  o.login as organization,
  u.site_admin,
  u.name,
  u.email,
  u.company,
  u.location,
  u.bio,
  u.public_repos,
  u.public_gists,
  u.twitter_username,
  u.two_factor_authentication,
  u.type
from
  github_user as u,
  github_my_organization as o,
  jsonb_array_elements_text(o.member_logins) as member_login
where
  u.login = member_login;
