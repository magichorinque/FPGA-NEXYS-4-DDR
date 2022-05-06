library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_H is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  EHS : in  std_logic;                -- Habilitacion horizontal
			  EC  : in  std_logic_vector(1 to 4); -- Fin de cuenta
      	  ST  : out std_logic_vector(1 to 4); -- Inicio de cuenta
      	  EDS : out std_logic;                -- Habilitacion de pixel
      	  HS  : out std_logic                 -- Sincronia horizontal
			  );
end FSM_H;

architecture Behavioral of FSM_H is

-- Estados internos
signal Qp, Qn : std_logic_vector(2 downto 0);

begin

Combinacional: process(EHS,EC,Qp)
   begin
      case Qp is
         when "000"  =>
            Qn  <= "001";
            ST  <= "0000";
            EDS <= '0';
            HS  <= '1';
         when "001"  =>
            if (EC(1)='1') then
               Qn <= "010";
            else
               Qn <= Qp;
            end if;
            ST  <= "1000";
            EDS <= '0';
            HS  <= '0';
         when "010"  =>
            if (EC(2)='1') then
               Qn <= "011";
            else
               Qn <= Qp;
            end if;
            ST  <= "0100";
            EDS <= '0';
            HS  <= '1';
         when "011"  =>
            if (EC(3)='1') then
               Qn <= "100";
            else
               Qn <= Qp;
            end if;
            ST  <= "0010";
            EDS <= EHS;
            HS  <= '1';
         when "100"  =>
            if (EC(4)='1') then
               Qn <= "001";
            else
               Qn <= Qp;
            end if;
            ST  <= "0001";
            EDS <= '0';
            HS  <= '1';
         when others =>
            Qn  <= "000";
            ST  <= "0000";
            EDS <= '0';
            HS  <= '1';
      end case;
   end process Combinacional;

   Secuencial: process(RST,CLK)
   begin
      if (RST='0') then
         Qp <= (others => '0');
      elsif (CLK'event and CLK='1') then 
         Qp <= Qn;
      end if;
   end process Secuencial;

end Behavioral;

