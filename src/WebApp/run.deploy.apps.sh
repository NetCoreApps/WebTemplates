# run.publish.bat with cmd.exe first

cat ../apps/bare/web.settings | sed "/debug/s/ .*/ false/" | sed "/port/s/ .*/ 5001/" > ../apps/web/web.bare.settings

cat ../apps/redis/web.settings | sed "/debug/s/ .*/ false/" | sed "/port/s/ .*/ 5002/" > ../apps/web/web.redis.settings

cat ../apps/rockwind/web.sqlite.settings | sed "/debug/s/ .*/ false/" | sed "/port/s/ .*/ 5003/" > ../apps/web/web.rockwind-sqlite.settings

cat ../apps/rockwind-vfs/web.sqlite.settings | sed "/debug/s/ .*/ false/" | sed "/port/s/ .*/ 5004/" > ../apps/web/web.rockwind-vfs-sqlite.settings

cat ../apps/plugins/web.settings | sed "/debug/s/ .*/ false/" | sed "/port/s/ .*/ 5005/" > ../apps/web/web.plugins.settings

cat ../apps/chat/web.release.settings | sed "/port/s/ .*/ 5006/" > ../apps/web/web.chat.settings

rsync -avz -e 'ssh' ../apps deploy@gistlyn.com:/home/deploy 
