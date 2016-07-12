require "custom_diff/version"

module CustomDiff
  # Longest common sequence
  module LCS
    # Build matrix
    def lsc(array1, array2)
      # i from 0 to n
      n = array1.size
      # j from 0 to m
      m = array2.size
      return [] if n.zero? && m.zero?
      # Initialize lcs_array with 0's
      lcs_array = Array.new(n+1) { Array.new(m+1, 0) }
      # First row and first column are set to 0
      1.upto n do |i|
        1.upto m do |j|
          if array1[i] == array2[j]
            lcs_array[i, j] = lcs_array[i-1, j-1] + 1
          else
            lcs_array[i, j] = [lcs_array[i-1, j], lcs_array[i, j-1]].max
          end
        end
      end
      lcs_array
    end

    def diff(array1, array2)
      # i from 0 to n
      n = array1.size
      # j from 0 to m
      m = array2.size
      lcs_array = lsc(array1, array2)
      lc_size = lcs_array[n, m]
      # TODO: find lsc itself
      # TODO: detect added, changed and removed parts
    end
  end
end
