use Amnesia

defdatabase Database do
  deftable(
    Staff,
    [{:id, autoincrement}, :first_name, :last_name, :age, :salary],
    type: :ordered_set,
    index: [:salary]
  )
end
