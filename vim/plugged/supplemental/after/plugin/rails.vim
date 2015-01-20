" Custom rails.vim projections
"
" See `:help rails-projections` for details
let g:rails_projections = {}

" Opens the given file under config/:
"
"   :[ERSTV]config <filename>
let g:rails_projections["config/*"] = {
  \   "command": "config"
  \ }

" Opens db/seeds.rb:
"
"   :[ERSTV]seed
let g:rails_projections["db/seeds.rb"] = {
  \   "command": "seed"
  \ }

" Opens the given file under db/seeds:
"
"   :[ERSTV]seed <filename>
let g:rails_projections["db/seeds/*.rb"] = {
  \   "command": "seed"
  \ }

" Opens/creates the given file under app/forms:
"
" :[ERSTV]form <filename>[!]
let g:rails_projections["app/forms/*_form.rb"] = {
  \   "command": "form",
  \   "test": "spec/forms/%i_spec.rb",
  \   "template": "class %SForm\n  include ActiveModel::Model\nend"
  \ }

" Opens the given file under app/inputs:
"
" :[ERSTV]input <filename>
let g:rails_projections["app/inputs/*.rb"] = {
  \   "command": "input",
  \   "test": "spec/inputs/%i_spec.rb"
  \ }

" Opens/creates the given file under app/validators:
"
" :[ERSTV]validator <filename>[!]
let g:rails_projections["app/validators/*.rb"] = {
  \   "command": "validator",
  \   "test": "spec/validators/%i_spec.rb",
  \   "template": "class %SValidator < ActiveModel::EachValidator\nend"
  \ }

" Opens/creates the given file under app/workers:
"
" :[ERSTV]worker <filename>[!]
let g:rails_projections["app/workers/*.rb"] = {
  \   "command": "worker",
  \   "test": "spec/workers/%i_spec.rb",
  \   "template": "class %SWorker\nend"
  \ }

" Opens/creates the given file under spec/factories:
"
" :[ERSTV]factory <filename>[!]
let g:rails_projections["spec/factories/*.rb"] = {
  \   "command": "factory",
  \   "affinity": "collection",
  \   "alternate": "app/models/%i.rb",
  \   "test": "spec/models/%i_spec.rb",
  \   "template": "FactoryGirl.define do\n  factory :%i do\n  end\nend",
  \   "keywords": "factory sequence"
  \ }

" Opens/creates the given file under app/assets/stylesheets
"
" :[ERSTV]stylesheet <filename>[!]
let g:rails_projections["app/assets/stylesheets/*"] = {
  \   "command": "stylesheet"
  \ }
