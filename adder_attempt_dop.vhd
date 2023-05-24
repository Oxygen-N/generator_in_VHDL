-- an attempt to make a working adder. connected to nothing

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_24bit is
  port (
    A : in std_logic_vector(23 downto 0);
    B : in std_logic_vector(23 downto 0);
    Sum : out std_logic_vector(23 downto 0)
  );
end entity adder_24bit;

architecture behavioral of adder_24bit is
begin
  process(A, B)
    variable tempsum : integer;
  begin
    tempsum := to_integer(signed(A)) + to_integer(signed(B));

    if tempsum < 0 then
      Sum <= not std_logic_vector(to_unsigned(abs(tempsum) + 1, 24));
    else
      Sum <= std_logic_vector(to_unsigned(tempsum, 24));
    end if;

  end process;
end architecture behavioral;
