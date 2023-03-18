param
(
    [string]$adduser = "aduseer1",
    [string]$domain = "example.local",
    [string]$group_add = "Administrators"
)

# Default will add to Administrator local group

$domain_user = $domain + '\' + $adduser

Add-LocalGroupMember -Group $group_add -Member $domain_user
