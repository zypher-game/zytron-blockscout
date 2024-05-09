cd /Users/admin/Desktop/blockscout/app


# 将项目文件拷贝到本地构建目录
cp -R /Users/admin/Desktop/blockscout/blockscout/* .

# 安装Elixir Hex和Rebar
mix local.hex --force
mix local.rebar --force

# 获取和编译依赖
mix deps.get
mix deps.compile


# 安装并构建前端资源
cd /Users/admin/Desktop/blockscout/app/apps/block_scout_web/assets/
npm install
npm run deploy
cd /Users/admin/Desktop/blockscout/app/apps/explorer
npm install



cd /Users/admin/Desktop/blockscout/app
# 编译并执行Phoenix digest
mix compile
mix phx.digest


# 在本地构建Release（请注意，这与Docker中的分阶段构建不同）
# Mac上可能不需要构建到/opt/release目录下，而是直接在项目根目录下构建
# mix release --env=prod

mix release blockscout


cp /Users/admin/Desktop/blockscout/blockscout/config/config_helper.exs /Users/admin/Desktop/blockscout/app/_build/prod/rel/blockscout/releases/6.3.0/ &&
cp -R /Users/admin/Desktop/blockscout/blockscout/apps/explorer/node_modules /Users/admin/Desktop/blockscout/app/_build/prod/rel/blockscout/node_modules &&
cp /Users/admin/Desktop/blockscout/blockscout/config/config_helper.exs /Users/admin/Desktop/blockscout/app/_build/prod/rel/blockscout/config/config_helper.exs
# cp /path/to/builder/config/config_helper.exs /path/to/local/releases/${RELEASE_VERSION}/