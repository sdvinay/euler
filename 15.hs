-- works!

-- to navigate an nxm grid, you need a path of length n+m with n steps down,
-- or (n+m)C(n), or in this case 40C20, which equals 40! / (20! * 20!)

answer = product [21..40] `div` product [2..20]
