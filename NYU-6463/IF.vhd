----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:15:47 11/09/2017 
-- Design Name: 
-- Module Name:    IF - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstFetch is
port(
		CLK : in std_logic;
		INST : out std_logic_vector(31 downto 0);
		ADDR : out std_logic_vector(31 downto 0)
	);
end InstFetch;

architecture Behavioral of InstFetch is
signal i_data : std_logic_vector (31 downto 0);
signal i_addr : std_logic_vector (31 downto 0):= (others=>'0');

begin

	process(CLK) 
		file in_file: text is in "imem.txt";
		variable buff : line;
		variable good : boolean;
		variable tmp : integer;
		 
		begin
			if (rising_edge(CLK)) and not(endfile(in_file)) then
				 readline(in_file, buff);
				 read(buff, tmp, good);
				 i_data <= conv_std_logic_vector(tmp,32);
				 INST <= i_data;
				 ADDR <= i_addr;
				 i_addr <= i_addr + '1';
			elsif endfile(in_file) then
				 file_close(in_file);
			end if;
 
	end process;

end Behavioral;

