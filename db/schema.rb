# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160410011745) do

  create_table "loans", force: :cascade do |t|
    t.integer "member_id"
    t.decimal "loan_amnt"
    t.decimal "funded_amnt"
    t.decimal "funded_amnt_inv"
    t.string  "term"
    t.string  "int_rate"
    t.decimal "installment"
    t.string  "grade"
    t.string  "sub_grade"
    t.string  "emp_title"
    t.string  "emp_length"
    t.string  "home_ownership"
    t.decimal "annual_inc"
    t.string  "verification_status"
    t.string  "issue_d"
    t.string  "loan_status"
    t.string  "pymnt_plan"
    t.string  "url"
    t.text    "desc"
    t.text    "purpose"
    t.string  "title"
    t.string  "zip_code"
    t.string  "addr_state"
    t.decimal "dti"
    t.decimal "delinq_2yrs"
    t.string  "earliest_cr_line"
    t.decimal "fico_range_low"
    t.decimal "fico_range_high"
    t.decimal "inq_last_6mths"
    t.decimal "mths_since_last_delinq"
    t.decimal "mths_since_last_record"
    t.decimal "open_acc"
    t.string  "pub_rec"
    t.decimal "revol_bal"
    t.string  "revol_util"
    t.decimal "total_acc"
    t.string  "initial_list_status"
    t.string  "out_prncp"
    t.string  "out_prncp_inv"
    t.decimal "total_pymnt"
    t.decimal "total_pymnt_inv"
    t.decimal "total_rec_prncp"
    t.decimal "total_rec_int"
    t.decimal "total_rec_late_fee"
    t.decimal "recoveries"
    t.decimal "collection_recovery_fee"
    t.string  "last_pymnt_d"
    t.decimal "last_pymnt_amnt"
    t.decimal "next_pymnt_d"
    t.string  "last_credit_pull_d"
    t.decimal "last_fico_range_low"
    t.decimal "collections_12_mths_ex_med"
    t.decimal "mths_since_last_major_derog"
    t.string  "policy_code"
    t.string  "application_type"
    t.decimal "last_fico_range_high"
  end

end
