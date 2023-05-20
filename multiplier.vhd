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
  signal X : signed(N downto 0);
begin
  X <= resize(signed(A), N+1) * to_signed(integer(C * 2.0**N), N+1);
  Y <= std_logic_vector(X(N-1 downto 0));
end architecture dataflow;
