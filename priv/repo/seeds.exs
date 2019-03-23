# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api.Repo.insert!(%Api.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias GraphqlSample.Data.datas
alias GraphqlSample.Repo

%Data{url: "http://graphql.org/", title: "test", artist: "testartist" } |> Repo.insert!
%Data{url: "http://dev.apollodata.com/", title: "test2", artist:"testartist2"} |> Repo.insert!