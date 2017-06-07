class Array
  def set_sort_algorithm(algorithm)
    @sorting_algorithm = algorithm
  end

  def sort
    unless @sorting_algorithm.nil?
      @sorting_algorithm.run(self)
    else
      super
    end
  end
end
