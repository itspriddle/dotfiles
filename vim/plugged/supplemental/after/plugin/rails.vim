" Custom rails.vim projections
"
" See `:help rails-projections` for details
let g:rails_projections = {}

" let g:rails_projections["*"] = { "keywords": "validates_attachment has_attachment" }

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
  \   "test": "spec/forms/{singular}_spec.rb",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Form",
  \     "  include ActiveModel::Model",
  \     "end"
  \   ]
  \ }

" Opens the given file under app/inputs:
"
" :[ERSTV]input <filename>
let g:rails_projections["app/inputs/*_input.rb"] = {
  \   "command": "input",
  \   "test": "spec/inputs/{singular}_spec.rb",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Input",
  \     "end"
  \   ]
  \ }

" Opens/creates the given file under app/validators:
"
" :[ERSTV]validator <filename>[!]
let g:rails_projections["app/validators/*_validator.rb"] = {
  \   "command": "validator",
  \   "test": "spec/validators/{singular}_spec.rb",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Validator < ActiveModel::EachValidator",
  \     "end"
  \   ]
  \ }

" Opens/creates the given file under app/workers:
"
" :[ERSTV]worker <filename>[!]
let g:rails_projections["app/workers/*_worker.rb"] = {
  \   "command": "worker",
  \   "test": "spec/workers/{singular}_spec.rb",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Worker",
  \     "end"
  \   ]
  \ }

" Opens/creates the given file under spec/factories:
"
" :[ERSTV]factory <filename>[!]
let g:rails_projections["spec/factories/*.rb"] = {
  \   "command": "factory",
  \   "affinity": "collection",
  \   "alternate": "app/models/{singular}.rb",
  \   "test": "spec/models/{singular}_spec.rb",
  \   "template": [
  \     "FactoryBot.define do",
  \     "  factory :{underscore|singular} do",
  \     "  end",
  \     "end"
  \   ],
  \   "keywords": "factory sequence"
  \ }

" Opens/creates the given file under app/services:
"
" :[ERSTV]validator <filename>[!]
let g:rails_projections["app/services/*_service.rb"] = {
  \   "command": "service",
  \   "test": "spec/services/{singular}_spec.rb",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Service",
  \     "end"
  \   ]
  \ }

" Patch usage of `:A[SV]` to work in a Rails engine where lib specs are in
" `spec/` rather than `spec/lib`.
let g:rails_projections["lib/*.rb"] = {
  \   "type": "lib",
  \   "test": "spec/{}_spec.rb"
  \ }

" Patch usage of `:A[SV]` to work in a Rails engine where lib specs are in
" `spec/` rather than `spec/lib`.
let g:rails_projections["spec/*_spec.rb"] = {
  \   "alternate": "lib/{}.rb"
  \ }

augroup ft_rails
  " Open the associated file in a horizontal split (overrides map in ft_ruby)
  autocmd User Rails noremap <buffer> <leader>s :AS<cr>

  " Open the associated file in a vertical split (overrides map in ft_ruby)
  autocmd User Rails noremap <buffer> <leader>v :AV<cr>

  " autocmd BufWinEnter *db/migrate/*.rb
  "   \ let b:migration = 1 |
  "   \ if 1 |
  "   \   execute 'keeppatterns %s,ActiveRecord::Migration,ActiveRecord::Migration[5.1],' |
  "   \ endif
augroup END
