library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity multiplier is
  generic (
    C : real := 0.5;
    N : integer := 24
  );
  port (
    A : in std_logic_vector(N-1 downto 0);
    Y : out std_logic_vector(N-1 downto 0)
  );
end entity multiplier;
 
architecture dataflow of multiplier is
  signal X : signed(2*N downto 0);
begin
  X <= signed(A) * to_signed(integer(C * 2.0**N), N+1);
  Y <= std_logic_vector(X(2*N-1 downto N));
end architecture dataflow;
 