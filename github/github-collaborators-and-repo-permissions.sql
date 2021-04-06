select
  name,
  c ->> 'login' as login,
  c -> 'permissions' -> 'pull' as can_pull,
  c -> 'permissions' -> 'push' as can_push,
  c -> 'permissions' -> 'admin' as is_admin
from
  github_my_repository,
  jsonb_array_elements(collaborators) as c
order by
  name,
  c ->> 'login';
