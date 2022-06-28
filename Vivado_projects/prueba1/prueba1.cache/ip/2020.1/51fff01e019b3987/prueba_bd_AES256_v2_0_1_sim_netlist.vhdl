-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Tue Feb 15 18:11:16 2022
-- Host        : pc6253 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ prueba_bd_AES256_v2_0_1_sim_netlist.vhdl
-- Design      : prueba_bd_AES256_v2_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_dec is
  port (
    s00_axi_aresetn_0 : out STD_LOGIC;
    data1test : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \slv_reg0_reg[1]\ : in STD_LOGIC;
    slv_reg_wren : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    ctrl_dataIn_dec_reg_reg_0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_dec;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_dec is
  signal \FSM_sequential_dec_st[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_dec_st[3]_i_3_n_0\ : STD_LOGIC;
  signal ctrl_dataIn_dec_reg : STD_LOGIC;
  signal \^data1test\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal dec_st : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal end_st_reg2_out : STD_LOGIC;
  signal end_st_reg_reg_n_0 : STD_LOGIC;
  signal rom_cnt : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \rom_cnt[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \rom_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \rom_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \rom_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \rom_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \rom_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal round : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \round[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \round[3]_i_3_n_0\ : STD_LOGIC;
  signal \round_reg_n_0_[0]\ : STD_LOGIC;
  signal \round_reg_n_0_[1]\ : STD_LOGIC;
  signal \round_reg_n_0_[2]\ : STD_LOGIC;
  signal \round_reg_n_0_[3]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_dec_st[0]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_dec_st[2]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_dec_st[3]_i_3\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_dec_st_reg[0]\ : label is "rom_st:0111,romw_st:1000,reg163_st:0110,end_round_st:0100,shf_st:0101,idle_st:0000,mixCol_st:0010,addRK_st:0001,reg162_st:0011,end_st:1010,reg161_st:1001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_dec_st_reg[1]\ : label is "rom_st:0111,romw_st:1000,reg163_st:0110,end_round_st:0100,shf_st:0101,idle_st:0000,mixCol_st:0010,addRK_st:0001,reg162_st:0011,end_st:1010,reg161_st:1001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_dec_st_reg[2]\ : label is "rom_st:0111,romw_st:1000,reg163_st:0110,end_round_st:0100,shf_st:0101,idle_st:0000,mixCol_st:0010,addRK_st:0001,reg162_st:0011,end_st:1010,reg161_st:1001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_dec_st_reg[3]\ : label is "rom_st:0111,romw_st:1000,reg163_st:0110,end_round_st:0100,shf_st:0101,idle_st:0000,mixCol_st:0010,addRK_st:0001,reg162_st:0011,end_st:1010,reg161_st:1001";
  attribute SOFT_HLUTNM of \rom_cnt[2]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \rom_cnt[3]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \rom_cnt[4]_i_2__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \round[0]_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \round[1]_i_1__1\ : label is "soft_lutpair3";
begin
  data1test(0) <= \^data1test\(0);
\FSM_sequential_dec_st[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEEEEEEEEEEEEE"
    )
        port map (
      I0 => \FSM_sequential_dec_st[0]_i_2_n_0\,
      I1 => \FSM_sequential_dec_st[0]_i_3_n_0\,
      I2 => dec_st(1),
      I3 => dec_st(0),
      I4 => dec_st(2),
      I5 => \FSM_sequential_dec_st[3]_i_2_n_0\,
      O => \FSM_sequential_dec_st[0]_i_1_n_0\
    );
\FSM_sequential_dec_st[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000222200F02222"
    )
        port map (
      I0 => \FSM_sequential_dec_st[0]_i_4_n_0\,
      I1 => dec_st(1),
      I2 => \FSM_sequential_dec_st[3]_i_3_n_0\,
      I3 => dec_st(3),
      I4 => dec_st(2),
      I5 => dec_st(0),
      O => \FSM_sequential_dec_st[0]_i_2_n_0\
    );
\FSM_sequential_dec_st[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0004F4"
    )
        port map (
      I0 => dec_st(2),
      I1 => ctrl_dataIn_dec_reg,
      I2 => dec_st(1),
      I3 => dec_st(3),
      I4 => dec_st(0),
      O => \FSM_sequential_dec_st[0]_i_3_n_0\
    );
\FSM_sequential_dec_st[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => \round_reg_n_0_[3]\,
      I1 => dec_st(0),
      I2 => \round_reg_n_0_[1]\,
      I3 => \round_reg_n_0_[2]\,
      I4 => dec_st(3),
      O => \FSM_sequential_dec_st[0]_i_4_n_0\
    );
\FSM_sequential_dec_st[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAAEAAAEEAAEAAA"
    )
        port map (
      I0 => \FSM_sequential_dec_st[1]_i_2_n_0\,
      I1 => dec_st(3),
      I2 => dec_st(2),
      I3 => dec_st(1),
      I4 => dec_st(0),
      I5 => \FSM_sequential_dec_st[3]_i_2_n_0\,
      O => \FSM_sequential_dec_st[1]_i_1_n_0\
    );
\FSM_sequential_dec_st[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000FC00FC0050"
    )
        port map (
      I0 => \FSM_sequential_dec_st[3]_i_3_n_0\,
      I1 => \FSM_sequential_dec_st[2]_i_3_n_0\,
      I2 => dec_st(2),
      I3 => dec_st(3),
      I4 => dec_st(0),
      I5 => dec_st(1),
      O => \FSM_sequential_dec_st[1]_i_2_n_0\
    );
\FSM_sequential_dec_st[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF50584048"
    )
        port map (
      I0 => dec_st(0),
      I1 => dec_st(1),
      I2 => dec_st(2),
      I3 => dec_st(3),
      I4 => \FSM_sequential_dec_st[3]_i_3_n_0\,
      I5 => \FSM_sequential_dec_st[2]_i_2_n_0\,
      O => \FSM_sequential_dec_st[2]_i_1_n_0\
    );
\FSM_sequential_dec_st[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFF0011AABB0011"
    )
        port map (
      I0 => dec_st(3),
      I1 => \FSM_sequential_dec_st[2]_i_3_n_0\,
      I2 => \FSM_sequential_dec_st[3]_i_2_n_0\,
      I3 => dec_st(1),
      I4 => dec_st(2),
      I5 => dec_st(0),
      O => \FSM_sequential_dec_st[2]_i_2_n_0\
    );
\FSM_sequential_dec_st[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => \round_reg_n_0_[2]\,
      I1 => \round_reg_n_0_[3]\,
      I2 => \round_reg_n_0_[0]\,
      I3 => \round_reg_n_0_[1]\,
      I4 => dec_st(0),
      O => \FSM_sequential_dec_st[2]_i_3_n_0\
    );
\FSM_sequential_dec_st[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDCCCC00CC00CFCC"
    )
        port map (
      I0 => \FSM_sequential_dec_st[3]_i_2_n_0\,
      I1 => dec_st(3),
      I2 => \FSM_sequential_dec_st[3]_i_3_n_0\,
      I3 => dec_st(2),
      I4 => dec_st(1),
      I5 => dec_st(0),
      O => \FSM_sequential_dec_st[3]_i_1_n_0\
    );
\FSM_sequential_dec_st[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => \rom_cnt_reg_n_0_[3]\,
      I1 => \rom_cnt_reg_n_0_[1]\,
      I2 => \rom_cnt_reg_n_0_[0]\,
      I3 => \rom_cnt_reg_n_0_[2]\,
      I4 => \rom_cnt_reg_n_0_[4]\,
      O => \FSM_sequential_dec_st[3]_i_2_n_0\
    );
\FSM_sequential_dec_st[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \round_reg_n_0_[3]\,
      I1 => \round_reg_n_0_[0]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[1]\,
      O => \FSM_sequential_dec_st[3]_i_3_n_0\
    );
\FSM_sequential_dec_st_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => \FSM_sequential_dec_st[0]_i_1_n_0\,
      Q => dec_st(0)
    );
\FSM_sequential_dec_st_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => \FSM_sequential_dec_st[1]_i_1_n_0\,
      Q => dec_st(1)
    );
\FSM_sequential_dec_st_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => \FSM_sequential_dec_st[2]_i_1_n_0\,
      Q => dec_st(2)
    );
\FSM_sequential_dec_st_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => \FSM_sequential_dec_st[3]_i_1_n_0\,
      Q => dec_st(3)
    );
ctrl_dataIn_dec_reg_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => Q(0),
      Q => ctrl_dataIn_dec_reg
    );
ctrl_dataOut_dec_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => end_st_reg_reg_n_0,
      Q => \^data1test\(0)
    );
\end_st_reg_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => dec_st(2),
      I1 => dec_st(3),
      I2 => end_st_reg_reg_n_0,
      I3 => dec_st(0),
      I4 => dec_st(1),
      O => end_st_reg2_out
    );
end_st_reg_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => end_st_reg2_out,
      Q => end_st_reg_reg_n_0
    );
\rom_cnt[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => dec_st(3),
      I1 => dec_st(1),
      I2 => dec_st(0),
      I3 => dec_st(2),
      I4 => \rom_cnt_reg_n_0_[0]\,
      O => rom_cnt(0)
    );
\rom_cnt[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000400040000000"
    )
        port map (
      I0 => dec_st(3),
      I1 => dec_st(1),
      I2 => dec_st(0),
      I3 => dec_st(2),
      I4 => \rom_cnt_reg_n_0_[1]\,
      I5 => \rom_cnt_reg_n_0_[0]\,
      O => rom_cnt(1)
    );
\rom_cnt[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2888"
    )
        port map (
      I0 => \rom_cnt[4]_i_2__0_n_0\,
      I1 => \rom_cnt_reg_n_0_[2]\,
      I2 => \rom_cnt_reg_n_0_[0]\,
      I3 => \rom_cnt_reg_n_0_[1]\,
      O => rom_cnt(2)
    );
\rom_cnt[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28888888"
    )
        port map (
      I0 => \rom_cnt[4]_i_2__0_n_0\,
      I1 => \rom_cnt_reg_n_0_[3]\,
      I2 => \rom_cnt_reg_n_0_[1]\,
      I3 => \rom_cnt_reg_n_0_[0]\,
      I4 => \rom_cnt_reg_n_0_[2]\,
      O => rom_cnt(3)
    );
\rom_cnt[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => \rom_cnt[4]_i_2__0_n_0\,
      I1 => \rom_cnt_reg_n_0_[4]\,
      I2 => \rom_cnt_reg_n_0_[2]\,
      I3 => \rom_cnt_reg_n_0_[0]\,
      I4 => \rom_cnt_reg_n_0_[1]\,
      I5 => \rom_cnt_reg_n_0_[3]\,
      O => rom_cnt(4)
    );
\rom_cnt[4]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => dec_st(2),
      I1 => dec_st(0),
      I2 => dec_st(1),
      I3 => dec_st(3),
      O => \rom_cnt[4]_i_2__0_n_0\
    );
\rom_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => rom_cnt(0),
      Q => \rom_cnt_reg_n_0_[0]\
    );
\rom_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => rom_cnt(1),
      Q => \rom_cnt_reg_n_0_[1]\
    );
\rom_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => rom_cnt(2),
      Q => \rom_cnt_reg_n_0_[2]\
    );
\rom_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => rom_cnt(3),
      Q => \rom_cnt_reg_n_0_[3]\
    );
\rom_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => rom_cnt(4),
      Q => \rom_cnt_reg_n_0_[4]\
    );
\round[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => dec_st(2),
      I1 => \round_reg_n_0_[0]\,
      O => round(0)
    );
\round[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \round_reg_n_0_[0]\,
      I1 => \round_reg_n_0_[1]\,
      I2 => dec_st(2),
      O => round(1)
    );
\round[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000007800"
    )
        port map (
      I0 => \round_reg_n_0_[1]\,
      I1 => \round_reg_n_0_[0]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => dec_st(2),
      I4 => dec_st(1),
      I5 => dec_st(0),
      O => round(2)
    );
\round[3]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => dec_st(1),
      I1 => dec_st(0),
      I2 => dec_st(3),
      O => \round[3]_i_1__1_n_0\
    );
\round[3]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \round[3]_i_3_n_0\,
      I1 => dec_st(2),
      O => round(3)
    );
\round[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000006AAA"
    )
        port map (
      I0 => \round_reg_n_0_[3]\,
      I1 => \round_reg_n_0_[1]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[0]\,
      I4 => dec_st(1),
      I5 => dec_st(0),
      O => \round[3]_i_3_n_0\
    );
\round_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \round[3]_i_1__1_n_0\,
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => round(0),
      Q => \round_reg_n_0_[0]\
    );
\round_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \round[3]_i_1__1_n_0\,
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => round(1),
      Q => \round_reg_n_0_[1]\
    );
\round_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \round[3]_i_1__1_n_0\,
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => round(2),
      Q => \round_reg_n_0_[2]\
    );
\round_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \round[3]_i_1__1_n_0\,
      CLR => ctrl_dataIn_dec_reg_reg_0,
      D => round(3),
      Q => \round_reg_n_0_[3]\
    );
\slv_reg0[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A808A8000008A80"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => s00_axi_wdata(0),
      I2 => p_1_in(0),
      I3 => \slv_reg0_reg[1]\,
      I4 => \^data1test\(0),
      I5 => slv_reg_wren,
      O => s00_axi_aresetn_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_enc is
  port (
    end_st_reg_reg_0 : out STD_LOGIC;
    data1test : out STD_LOGIC_VECTOR ( 0 to 0 );
    end_st_reg_delay : out STD_LOGIC;
    s00_axi_aresetn_0 : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    \FSM_onehot_enc_st_reg[7]_0\ : in STD_LOGIC;
    end_st_reg_delay_reg_0 : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \slv_reg0_reg[0]\ : in STD_LOGIC;
    slv_reg_wren : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_enc;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_enc is
  signal \FSM_onehot_enc_st[10]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[10]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[10]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[10]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[10]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[8]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st[9]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_enc_st_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_enc_st_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_enc_st_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_enc_st_reg_n_0_[6]\ : STD_LOGIC;
  signal \FSM_onehot_enc_st_reg_n_0_[7]\ : STD_LOGIC;
  signal \^data1test\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal end_st_reg : STD_LOGIC;
  signal \^end_st_reg_delay\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_1_in_0 : STD_LOGIC;
  signal req_rom : STD_LOGIC;
  signal \rom_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal rom_cnt_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal round : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \round[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \round[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \round_reg_n_0_[0]\ : STD_LOGIC;
  signal \round_reg_n_0_[1]\ : STD_LOGIC;
  signal \round_reg_n_0_[2]\ : STD_LOGIC;
  signal \round_reg_n_0_[3]\ : STD_LOGIC;
  signal wr_mC : STD_LOGIC;
  signal wr_reg162 : STD_LOGIC;
  signal wr_reg163 : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[0]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[10]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[1]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[2]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[3]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[4]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[5]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[6]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[7]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[8]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_enc_st_reg[9]\ : label is "rom_st:00000000001,romw_st:00000000010,reg163_st:00000001000,end_round_st:00000010000,addRK_st:00001000000,idle_st:00010000000,reg162_st:00100000000,mixCol_st:01000000000,controlreset_st:10000000000,end_st:00000100000,shf_st:00000000100";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rom_cnt[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rom_cnt[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rom_cnt[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rom_cnt[4]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \round[0]_i_1__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \round[1]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \round[2]_i_1__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \round[3]_i_2__0\ : label is "soft_lutpair5";
begin
  data1test(0) <= \^data1test\(0);
  end_st_reg_delay <= \^end_st_reg_delay\;
\FSM_onehot_enc_st[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wr_reg163,
      I1 => \FSM_onehot_enc_st_reg_n_0_[4]\,
      I2 => \FSM_onehot_enc_st_reg_n_0_[1]\,
      I3 => \FSM_onehot_enc_st_reg_n_0_[2]\,
      I4 => \FSM_onehot_enc_st[10]_i_3_n_0\,
      I5 => \FSM_onehot_enc_st[10]_i_4_n_0\,
      O => \FSM_onehot_enc_st[10]_i_1_n_0\
    );
\FSM_onehot_enc_st[10]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => p_1_in_0,
      I1 => Q(0),
      I2 => end_st_reg,
      O => \FSM_onehot_enc_st[10]_i_2_n_0\
    );
\FSM_onehot_enc_st[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00800000"
    )
        port map (
      I0 => \FSM_onehot_enc_st[10]_i_5_n_0\,
      I1 => rom_cnt_reg(3),
      I2 => rom_cnt_reg(2),
      I3 => rom_cnt_reg(4),
      I4 => req_rom,
      I5 => wr_mC,
      O => \FSM_onehot_enc_st[10]_i_3_n_0\
    );
\FSM_onehot_enc_st[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFEFFFFFFFC"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[7]\,
      I1 => \FSM_onehot_enc_st_reg_n_0_[6]\,
      I2 => wr_reg162,
      I3 => end_st_reg,
      I4 => p_1_in_0,
      I5 => Q(0),
      O => \FSM_onehot_enc_st[10]_i_4_n_0\
    );
\FSM_onehot_enc_st[10]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => rom_cnt_reg(0),
      I1 => rom_cnt_reg(1),
      O => \FSM_onehot_enc_st[10]_i_5_n_0\
    );
\FSM_onehot_enc_st[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[4]\,
      I1 => \round_reg_n_0_[1]\,
      I2 => \round_reg_n_0_[3]\,
      I3 => \round_reg_n_0_[2]\,
      I4 => \round_reg_n_0_[0]\,
      O => \FSM_onehot_enc_st[5]_i_1_n_0\
    );
\FSM_onehot_enc_st[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAA2AAA"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[4]\,
      I1 => \round_reg_n_0_[0]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[3]\,
      I4 => \round_reg_n_0_[1]\,
      I5 => \FSM_onehot_enc_st_reg_n_0_[7]\,
      O => \FSM_onehot_enc_st[6]_i_1_n_0\
    );
\FSM_onehot_enc_st[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_1_in_0,
      I1 => Q(0),
      O => \FSM_onehot_enc_st[7]_i_1_n_0\
    );
\FSM_onehot_enc_st[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAEAAAAAAAAAAA"
    )
        port map (
      I0 => wr_mC,
      I1 => \round_reg_n_0_[1]\,
      I2 => \round_reg_n_0_[3]\,
      I3 => \round_reg_n_0_[2]\,
      I4 => \round_reg_n_0_[0]\,
      I5 => \FSM_onehot_enc_st_reg_n_0_[2]\,
      O => \FSM_onehot_enc_st[8]_i_1_n_0\
    );
\FSM_onehot_enc_st[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10F0F0F0"
    )
        port map (
      I0 => \round_reg_n_0_[0]\,
      I1 => \round_reg_n_0_[1]\,
      I2 => \FSM_onehot_enc_st_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[2]\,
      I4 => \round_reg_n_0_[3]\,
      O => \FSM_onehot_enc_st[9]_i_1_n_0\
    );
\FSM_onehot_enc_st_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => wr_reg163,
      Q => req_rom
    );
\FSM_onehot_enc_st_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \FSM_onehot_enc_st[10]_i_2_n_0\,
      Q => p_1_in_0
    );
\FSM_onehot_enc_st_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => req_rom,
      Q => \FSM_onehot_enc_st_reg_n_0_[1]\
    );
\FSM_onehot_enc_st_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \FSM_onehot_enc_st_reg_n_0_[1]\,
      Q => \FSM_onehot_enc_st_reg_n_0_[2]\
    );
\FSM_onehot_enc_st_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \FSM_onehot_enc_st_reg_n_0_[6]\,
      Q => wr_reg163
    );
\FSM_onehot_enc_st_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => wr_reg162,
      Q => \FSM_onehot_enc_st_reg_n_0_[4]\
    );
\FSM_onehot_enc_st_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \FSM_onehot_enc_st[5]_i_1_n_0\,
      Q => end_st_reg
    );
\FSM_onehot_enc_st_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \FSM_onehot_enc_st[6]_i_1_n_0\,
      Q => \FSM_onehot_enc_st_reg_n_0_[6]\
    );
\FSM_onehot_enc_st_reg[7]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      D => \FSM_onehot_enc_st[7]_i_1_n_0\,
      PRE => \FSM_onehot_enc_st_reg[7]_0\,
      Q => \FSM_onehot_enc_st_reg_n_0_[7]\
    );
\FSM_onehot_enc_st_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \FSM_onehot_enc_st[8]_i_1_n_0\,
      Q => wr_reg162
    );
\FSM_onehot_enc_st_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_enc_st[10]_i_1_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \FSM_onehot_enc_st[9]_i_1_n_0\,
      Q => wr_mC
    );
ctrl_dataOut_enc_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \^end_st_reg_delay\,
      Q => \^data1test\(0)
    );
end_st_reg_delay_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => end_st_reg_delay_reg_0,
      Q => \^end_st_reg_delay\,
      R => '0'
    );
end_st_reg_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => end_st_reg,
      Q => end_st_reg_reg_0
    );
\rom_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[1]\,
      I1 => req_rom,
      I2 => rom_cnt_reg(0),
      O => p_0_in(0)
    );
\rom_cnt[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0EE0"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[1]\,
      I1 => req_rom,
      I2 => rom_cnt_reg(1),
      I3 => rom_cnt_reg(0),
      O => p_0_in(1)
    );
\rom_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0EE0E0E0"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[1]\,
      I1 => req_rom,
      I2 => rom_cnt_reg(2),
      I3 => rom_cnt_reg(0),
      I4 => rom_cnt_reg(1),
      O => p_0_in(2)
    );
\rom_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0EE0E0E0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[1]\,
      I1 => req_rom,
      I2 => rom_cnt_reg(3),
      I3 => rom_cnt_reg(1),
      I4 => rom_cnt_reg(0),
      I5 => rom_cnt_reg(2),
      O => p_0_in(3)
    );
\rom_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => \rom_cnt[4]_i_2_n_0\,
      I1 => rom_cnt_reg(4),
      I2 => rom_cnt_reg(3),
      I3 => rom_cnt_reg(2),
      I4 => rom_cnt_reg(1),
      I5 => rom_cnt_reg(0),
      O => p_0_in(4)
    );
\rom_cnt[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => req_rom,
      I1 => \FSM_onehot_enc_st_reg_n_0_[1]\,
      O => \rom_cnt[4]_i_2_n_0\
    );
\rom_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => p_0_in(0),
      Q => rom_cnt_reg(0)
    );
\rom_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => p_0_in(1),
      Q => rom_cnt_reg(1)
    );
\rom_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => p_0_in(2),
      Q => rom_cnt_reg(2)
    );
\rom_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => p_0_in(3),
      Q => rom_cnt_reg(3)
    );
\rom_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => p_0_in(4),
      Q => rom_cnt_reg(4)
    );
\round[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[4]\,
      I1 => \round_reg_n_0_[0]\,
      O => \round[0]_i_1__1_n_0\
    );
\round[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[4]\,
      I1 => \round_reg_n_0_[1]\,
      I2 => \round_reg_n_0_[0]\,
      O => round(1)
    );
\round[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2888"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[4]\,
      I1 => \round_reg_n_0_[2]\,
      I2 => \round_reg_n_0_[0]\,
      I3 => \round_reg_n_0_[1]\,
      O => round(2)
    );
\round[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_1_in_0,
      I1 => \FSM_onehot_enc_st_reg_n_0_[7]\,
      I2 => \FSM_onehot_enc_st_reg_n_0_[4]\,
      O => \round[3]_i_1__0_n_0\
    );
\round[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28888888"
    )
        port map (
      I0 => \FSM_onehot_enc_st_reg_n_0_[4]\,
      I1 => \round_reg_n_0_[3]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[1]\,
      I4 => \round_reg_n_0_[0]\,
      O => round(3)
    );
\round_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \round[3]_i_1__0_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => \round[0]_i_1__1_n_0\,
      Q => \round_reg_n_0_[0]\
    );
\round_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \round[3]_i_1__0_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => round(1),
      Q => \round_reg_n_0_[1]\
    );
\round_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \round[3]_i_1__0_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => round(2),
      Q => \round_reg_n_0_[2]\
    );
\round_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \round[3]_i_1__0_n_0\,
      CLR => \FSM_onehot_enc_st_reg[7]_0\,
      D => round(3),
      Q => \round_reg_n_0_[3]\
    );
\slv_reg0[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A808A8000008A80"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => s00_axi_wdata(0),
      I2 => p_1_in(0),
      I3 => \slv_reg0_reg[0]\,
      I4 => \^data1test\(0),
      I5 => slv_reg_wren,
      O => s00_axi_aresetn_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_keygen is
  port (
    s00_axi_aresetn_0 : out STD_LOGIC;
    data1test : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aresetn_1 : out STD_LOGIC;
    \key_num_reg[0]_0\ : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    slv_reg_wren : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_keygen;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_keygen is
  signal cond_getWord : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \cond_getWord_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal ctrl_dataOut_kg_i_1_n_0 : STD_LOGIC;
  signal ctrl_dataOut_kg_i_2_n_0 : STD_LOGIC;
  signal ctrl_dataOut_kg_i_3_n_0 : STD_LOGIC;
  signal ctrl_dataOut_kg_i_4_n_0 : STD_LOGIC;
  signal ctrl_dataOut_kg_i_5_n_0 : STD_LOGIC;
  signal ctrl_dataOut_kg_i_6_n_0 : STD_LOGIC;
  signal ctrl_dataOut_kg_i_7_n_0 : STD_LOGIC;
  signal ctrl_dataOut_kg_i_8_n_0 : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 3 );
  signal \^data1test\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal end_st_reg : STD_LOGIC;
  signal end_st_reg_i_1_n_0 : STD_LOGIC;
  signal iOut0_out : STD_LOGIC_VECTOR ( 31 downto 3 );
  signal \iOut[6]_i_3_n_0\ : STD_LOGIC;
  signal \iOut_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \iOut_reg[10]_i_2_n_1\ : STD_LOGIC;
  signal \iOut_reg[10]_i_2_n_2\ : STD_LOGIC;
  signal \iOut_reg[10]_i_2_n_3\ : STD_LOGIC;
  signal \iOut_reg[14]_i_2_n_0\ : STD_LOGIC;
  signal \iOut_reg[14]_i_2_n_1\ : STD_LOGIC;
  signal \iOut_reg[14]_i_2_n_2\ : STD_LOGIC;
  signal \iOut_reg[14]_i_2_n_3\ : STD_LOGIC;
  signal \iOut_reg[18]_i_2_n_0\ : STD_LOGIC;
  signal \iOut_reg[18]_i_2_n_1\ : STD_LOGIC;
  signal \iOut_reg[18]_i_2_n_2\ : STD_LOGIC;
  signal \iOut_reg[18]_i_2_n_3\ : STD_LOGIC;
  signal \iOut_reg[22]_i_2_n_0\ : STD_LOGIC;
  signal \iOut_reg[22]_i_2_n_1\ : STD_LOGIC;
  signal \iOut_reg[22]_i_2_n_2\ : STD_LOGIC;
  signal \iOut_reg[22]_i_2_n_3\ : STD_LOGIC;
  signal \iOut_reg[26]_i_2_n_0\ : STD_LOGIC;
  signal \iOut_reg[26]_i_2_n_1\ : STD_LOGIC;
  signal \iOut_reg[26]_i_2_n_2\ : STD_LOGIC;
  signal \iOut_reg[26]_i_2_n_3\ : STD_LOGIC;
  signal \iOut_reg[30]_i_2_n_0\ : STD_LOGIC;
  signal \iOut_reg[30]_i_2_n_1\ : STD_LOGIC;
  signal \iOut_reg[30]_i_2_n_2\ : STD_LOGIC;
  signal \iOut_reg[30]_i_2_n_3\ : STD_LOGIC;
  signal \iOut_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \iOut_reg[6]_i_2_n_1\ : STD_LOGIC;
  signal \iOut_reg[6]_i_2_n_2\ : STD_LOGIC;
  signal \iOut_reg[6]_i_2_n_3\ : STD_LOGIC;
  signal \iOut_reg_n_0_[10]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[11]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[12]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[13]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[14]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[15]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[16]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[17]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[18]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[19]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[20]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[21]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[22]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[23]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[24]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[25]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[26]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[27]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[28]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[29]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[30]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[31]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[3]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[4]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[5]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[6]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[7]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[8]\ : STD_LOGIC;
  signal \iOut_reg_n_0_[9]\ : STD_LOGIC;
  signal key_num0 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \key_num[0]_i_1_n_0\ : STD_LOGIC;
  signal \key_num[1]_i_1_n_0\ : STD_LOGIC;
  signal key_num_delay : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \key_num_reg_n_0_[0]\ : STD_LOGIC;
  signal \key_num_reg_n_0_[1]\ : STD_LOGIC;
  signal kg_st : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \kg_st[0]_i_1_n_0\ : STD_LOGIC;
  signal \kg_st[1]_i_1_n_0\ : STD_LOGIC;
  signal \kg_st[2]_i_1_n_0\ : STD_LOGIC;
  signal \kg_st[3]_i_1_n_0\ : STD_LOGIC;
  signal \kg_st[3]_i_2_n_0\ : STD_LOGIC;
  signal \kg_st[3]_i_3_n_0\ : STD_LOGIC;
  signal \kg_st[3]_i_4_n_0\ : STD_LOGIC;
  signal \kg_st[3]_i_5_n_0\ : STD_LOGIC;
  signal \kg_st[3]_i_6_n_0\ : STD_LOGIC;
  signal \kg_st[3]_i_7_n_0\ : STD_LOGIC;
  signal round : STD_LOGIC;
  signal \round[0]_i_1_n_0\ : STD_LOGIC;
  signal \round[1]_i_1_n_0\ : STD_LOGIC;
  signal \round[2]_i_1_n_0\ : STD_LOGIC;
  signal \round[3]_i_1_n_0\ : STD_LOGIC;
  signal \round[3]_i_2_n_0\ : STD_LOGIC;
  signal \round[4]_i_1_n_0\ : STD_LOGIC;
  signal \round[4]_i_2_n_0\ : STD_LOGIC;
  signal \round[4]_i_3_n_0\ : STD_LOGIC;
  signal \round[5]_i_1_n_0\ : STD_LOGIC;
  signal \round[5]_i_2_n_0\ : STD_LOGIC;
  signal \round[6]_i_1_n_0\ : STD_LOGIC;
  signal \round[7]_i_2_n_0\ : STD_LOGIC;
  signal \round[7]_i_3_n_0\ : STD_LOGIC;
  signal \round[7]_i_4_n_0\ : STD_LOGIC;
  signal \round_reg_n_0_[0]\ : STD_LOGIC;
  signal \round_reg_n_0_[1]\ : STD_LOGIC;
  signal \round_reg_n_0_[2]\ : STD_LOGIC;
  signal \round_reg_n_0_[3]\ : STD_LOGIC;
  signal \round_reg_n_0_[4]\ : STD_LOGIC;
  signal \round_reg_n_0_[5]\ : STD_LOGIC;
  signal \round_reg_n_0_[6]\ : STD_LOGIC;
  signal \round_reg_n_0_[7]\ : STD_LOGIC;
  signal \^s00_axi_aresetn_1\ : STD_LOGIC;
  signal subWord_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \subWord_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \subWord_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \NLW_iOut_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_iOut_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \cond_getWord_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \cond_getWord_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \cond_getWord_reg[2]\ : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cond_getWord_reg[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of end_st_reg_i_1 : label is "soft_lutpair14";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \iOut_reg[10]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \iOut_reg[14]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \iOut_reg[18]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \iOut_reg[22]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \iOut_reg[26]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \iOut_reg[30]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \iOut_reg[31]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \iOut_reg[6]_i_2\ : label is 35;
  attribute SOFT_HLUTNM of \key_num[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \key_num[1]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \kg_st[3]_i_3\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \kg_st[3]_i_7\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \round[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \round[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \round[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \round[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \round[3]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \round[4]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \round[4]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \round[6]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \round[7]_i_4\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \subWord_cnt[0]_i_1\ : label is "soft_lutpair10";
begin
  data1test(0) <= \^data1test\(0);
  s00_axi_aresetn_1 <= \^s00_axi_aresetn_1\;
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^s00_axi_aresetn_1\
    );
\cond_getWord_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \round_reg_n_0_[0]\,
      G => \cond_getWord_reg[2]_i_1_n_0\,
      GE => '1',
      Q => cond_getWord(0)
    );
\cond_getWord_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \round_reg_n_0_[1]\,
      G => \cond_getWord_reg[2]_i_1_n_0\,
      GE => '1',
      Q => cond_getWord(1)
    );
\cond_getWord_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \round_reg_n_0_[2]\,
      G => \cond_getWord_reg[2]_i_1_n_0\,
      GE => '1',
      Q => cond_getWord(2)
    );
\cond_getWord_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => kg_st(2),
      I1 => kg_st(3),
      I2 => kg_st(0),
      I3 => kg_st(1),
      O => \cond_getWord_reg[2]_i_1_n_0\
    );
ctrl_dataOut_kg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA2FFFFAAA20000"
    )
        port map (
      I0 => end_st_reg,
      I1 => ctrl_dataOut_kg_i_2_n_0,
      I2 => ctrl_dataOut_kg_i_3_n_0,
      I3 => ctrl_dataOut_kg_i_4_n_0,
      I4 => s00_axi_aresetn,
      I5 => \^data1test\(0),
      O => ctrl_dataOut_kg_i_1_n_0
    );
ctrl_dataOut_kg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => ctrl_dataOut_kg_i_5_n_0,
      I1 => ctrl_dataOut_kg_i_6_n_0,
      I2 => \iOut_reg_n_0_[9]\,
      I3 => \iOut_reg_n_0_[8]\,
      I4 => \iOut_reg_n_0_[11]\,
      I5 => \iOut_reg_n_0_[10]\,
      O => ctrl_dataOut_kg_i_2_n_0
    );
ctrl_dataOut_kg_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \iOut_reg_n_0_[26]\,
      I1 => \iOut_reg_n_0_[30]\,
      I2 => \iOut_reg_n_0_[24]\,
      I3 => \iOut_reg_n_0_[25]\,
      I4 => ctrl_dataOut_kg_i_7_n_0,
      O => ctrl_dataOut_kg_i_3_n_0
    );
ctrl_dataOut_kg_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \iOut_reg_n_0_[18]\,
      I1 => \iOut_reg_n_0_[19]\,
      I2 => \iOut_reg_n_0_[16]\,
      I3 => \iOut_reg_n_0_[17]\,
      I4 => ctrl_dataOut_kg_i_8_n_0,
      O => ctrl_dataOut_kg_i_4_n_0
    );
ctrl_dataOut_kg_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \iOut_reg_n_0_[28]\,
      I1 => \iOut_reg_n_0_[27]\,
      I2 => \iOut_reg_n_0_[31]\,
      I3 => \iOut_reg_n_0_[29]\,
      I4 => \iOut_reg_n_0_[3]\,
      O => ctrl_dataOut_kg_i_5_n_0
    );
ctrl_dataOut_kg_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \iOut_reg_n_0_[13]\,
      I1 => \iOut_reg_n_0_[12]\,
      I2 => \iOut_reg_n_0_[15]\,
      I3 => \iOut_reg_n_0_[14]\,
      O => ctrl_dataOut_kg_i_6_n_0
    );
ctrl_dataOut_kg_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \iOut_reg_n_0_[7]\,
      I1 => \iOut_reg_n_0_[4]\,
      I2 => \iOut_reg_n_0_[5]\,
      I3 => \iOut_reg_n_0_[6]\,
      O => ctrl_dataOut_kg_i_7_n_0
    );
ctrl_dataOut_kg_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \iOut_reg_n_0_[21]\,
      I1 => \iOut_reg_n_0_[20]\,
      I2 => \iOut_reg_n_0_[23]\,
      I3 => \iOut_reg_n_0_[22]\,
      O => ctrl_dataOut_kg_i_8_n_0
    );
ctrl_dataOut_kg_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => ctrl_dataOut_kg_i_1_n_0,
      Q => \^data1test\(0),
      R => '0'
    );
end_st_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => kg_st(2),
      I1 => kg_st(3),
      I2 => kg_st(1),
      I3 => kg_st(0),
      O => end_st_reg_i_1_n_0
    );
end_st_reg_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => end_st_reg_i_1_n_0,
      Q => end_st_reg
    );
\iOut[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(10),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(10)
    );
\iOut[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(11),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(11)
    );
\iOut[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(12),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(12)
    );
\iOut[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(13),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(13)
    );
\iOut[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(14),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(14)
    );
\iOut[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(15),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(15)
    );
\iOut[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(16),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(16)
    );
\iOut[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(17),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(17)
    );
\iOut[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(18),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(18)
    );
\iOut[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(19),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(19)
    );
\iOut[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(20),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(20)
    );
\iOut[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(21),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(21)
    );
\iOut[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(22),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(22)
    );
\iOut[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(23),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(23)
    );
\iOut[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(24),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(24)
    );
\iOut[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(25),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(25)
    );
\iOut[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(26),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(26)
    );
\iOut[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(27),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(27)
    );
\iOut[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(28),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(28)
    );
\iOut[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(29),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(29)
    );
\iOut[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(30),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(30)
    );
\iOut[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(31),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(31)
    );
\iOut[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(3),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(3)
    );
\iOut[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(4),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(4)
    );
\iOut[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(5),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(5)
    );
\iOut[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(6),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(6)
    );
\iOut[6]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \iOut_reg_n_0_[4]\,
      O => \iOut[6]_i_3_n_0\
    );
\iOut[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(7),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(7)
    );
\iOut[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(8),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(8)
    );
\iOut[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888808"
    )
        port map (
      I0 => data0(9),
      I1 => end_st_reg,
      I2 => ctrl_dataOut_kg_i_2_n_0,
      I3 => ctrl_dataOut_kg_i_3_n_0,
      I4 => ctrl_dataOut_kg_i_4_n_0,
      O => iOut0_out(9)
    );
\iOut_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(10),
      Q => \iOut_reg_n_0_[10]\
    );
\iOut_reg[10]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \iOut_reg[6]_i_2_n_0\,
      CO(3) => \iOut_reg[10]_i_2_n_0\,
      CO(2) => \iOut_reg[10]_i_2_n_1\,
      CO(1) => \iOut_reg[10]_i_2_n_2\,
      CO(0) => \iOut_reg[10]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(10 downto 7),
      S(3) => \iOut_reg_n_0_[10]\,
      S(2) => \iOut_reg_n_0_[9]\,
      S(1) => \iOut_reg_n_0_[8]\,
      S(0) => \iOut_reg_n_0_[7]\
    );
\iOut_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(11),
      Q => \iOut_reg_n_0_[11]\
    );
\iOut_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(12),
      Q => \iOut_reg_n_0_[12]\
    );
\iOut_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(13),
      Q => \iOut_reg_n_0_[13]\
    );
\iOut_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(14),
      Q => \iOut_reg_n_0_[14]\
    );
\iOut_reg[14]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \iOut_reg[10]_i_2_n_0\,
      CO(3) => \iOut_reg[14]_i_2_n_0\,
      CO(2) => \iOut_reg[14]_i_2_n_1\,
      CO(1) => \iOut_reg[14]_i_2_n_2\,
      CO(0) => \iOut_reg[14]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(14 downto 11),
      S(3) => \iOut_reg_n_0_[14]\,
      S(2) => \iOut_reg_n_0_[13]\,
      S(1) => \iOut_reg_n_0_[12]\,
      S(0) => \iOut_reg_n_0_[11]\
    );
\iOut_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(15),
      Q => \iOut_reg_n_0_[15]\
    );
\iOut_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(16),
      Q => \iOut_reg_n_0_[16]\
    );
\iOut_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(17),
      Q => \iOut_reg_n_0_[17]\
    );
\iOut_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(18),
      Q => \iOut_reg_n_0_[18]\
    );
\iOut_reg[18]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \iOut_reg[14]_i_2_n_0\,
      CO(3) => \iOut_reg[18]_i_2_n_0\,
      CO(2) => \iOut_reg[18]_i_2_n_1\,
      CO(1) => \iOut_reg[18]_i_2_n_2\,
      CO(0) => \iOut_reg[18]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(18 downto 15),
      S(3) => \iOut_reg_n_0_[18]\,
      S(2) => \iOut_reg_n_0_[17]\,
      S(1) => \iOut_reg_n_0_[16]\,
      S(0) => \iOut_reg_n_0_[15]\
    );
\iOut_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(19),
      Q => \iOut_reg_n_0_[19]\
    );
\iOut_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(20),
      Q => \iOut_reg_n_0_[20]\
    );
\iOut_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(21),
      Q => \iOut_reg_n_0_[21]\
    );
\iOut_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(22),
      Q => \iOut_reg_n_0_[22]\
    );
\iOut_reg[22]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \iOut_reg[18]_i_2_n_0\,
      CO(3) => \iOut_reg[22]_i_2_n_0\,
      CO(2) => \iOut_reg[22]_i_2_n_1\,
      CO(1) => \iOut_reg[22]_i_2_n_2\,
      CO(0) => \iOut_reg[22]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(22 downto 19),
      S(3) => \iOut_reg_n_0_[22]\,
      S(2) => \iOut_reg_n_0_[21]\,
      S(1) => \iOut_reg_n_0_[20]\,
      S(0) => \iOut_reg_n_0_[19]\
    );
\iOut_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(23),
      Q => \iOut_reg_n_0_[23]\
    );
\iOut_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(24),
      Q => \iOut_reg_n_0_[24]\
    );
\iOut_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(25),
      Q => \iOut_reg_n_0_[25]\
    );
\iOut_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(26),
      Q => \iOut_reg_n_0_[26]\
    );
\iOut_reg[26]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \iOut_reg[22]_i_2_n_0\,
      CO(3) => \iOut_reg[26]_i_2_n_0\,
      CO(2) => \iOut_reg[26]_i_2_n_1\,
      CO(1) => \iOut_reg[26]_i_2_n_2\,
      CO(0) => \iOut_reg[26]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(26 downto 23),
      S(3) => \iOut_reg_n_0_[26]\,
      S(2) => \iOut_reg_n_0_[25]\,
      S(1) => \iOut_reg_n_0_[24]\,
      S(0) => \iOut_reg_n_0_[23]\
    );
\iOut_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(27),
      Q => \iOut_reg_n_0_[27]\
    );
\iOut_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(28),
      Q => \iOut_reg_n_0_[28]\
    );
\iOut_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(29),
      Q => \iOut_reg_n_0_[29]\
    );
\iOut_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(30),
      Q => \iOut_reg_n_0_[30]\
    );
\iOut_reg[30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \iOut_reg[26]_i_2_n_0\,
      CO(3) => \iOut_reg[30]_i_2_n_0\,
      CO(2) => \iOut_reg[30]_i_2_n_1\,
      CO(1) => \iOut_reg[30]_i_2_n_2\,
      CO(0) => \iOut_reg[30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(30 downto 27),
      S(3) => \iOut_reg_n_0_[30]\,
      S(2) => \iOut_reg_n_0_[29]\,
      S(1) => \iOut_reg_n_0_[28]\,
      S(0) => \iOut_reg_n_0_[27]\
    );
\iOut_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(31),
      Q => \iOut_reg_n_0_[31]\
    );
\iOut_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \iOut_reg[30]_i_2_n_0\,
      CO(3 downto 0) => \NLW_iOut_reg[31]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_iOut_reg[31]_i_2_O_UNCONNECTED\(3 downto 1),
      O(0) => data0(31),
      S(3 downto 1) => B"000",
      S(0) => \iOut_reg_n_0_[31]\
    );
\iOut_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(3),
      Q => \iOut_reg_n_0_[3]\
    );
\iOut_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(4),
      Q => \iOut_reg_n_0_[4]\
    );
\iOut_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(5),
      Q => \iOut_reg_n_0_[5]\
    );
\iOut_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(6),
      Q => \iOut_reg_n_0_[6]\
    );
\iOut_reg[6]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \iOut_reg[6]_i_2_n_0\,
      CO(2) => \iOut_reg[6]_i_2_n_1\,
      CO(1) => \iOut_reg[6]_i_2_n_2\,
      CO(0) => \iOut_reg[6]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \iOut_reg_n_0_[4]\,
      DI(0) => '0',
      O(3 downto 0) => data0(6 downto 3),
      S(3) => \iOut_reg_n_0_[6]\,
      S(2) => \iOut_reg_n_0_[5]\,
      S(1) => \iOut[6]_i_3_n_0\,
      S(0) => \iOut_reg_n_0_[3]\
    );
\iOut_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(7),
      Q => \iOut_reg_n_0_[7]\
    );
\iOut_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(8),
      Q => \iOut_reg_n_0_[8]\
    );
\iOut_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => iOut0_out(9),
      Q => \iOut_reg_n_0_[9]\
    );
\key_num[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \key_num_reg_n_0_[0]\,
      O => \key_num[0]_i_1_n_0\
    );
\key_num[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \key_num_reg[0]_0\,
      I1 => key_num_delay(1),
      O => \key_num[1]_i_1_n_0\
    );
\key_num[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \key_num_reg_n_0_[1]\,
      I1 => \key_num_reg_n_0_[0]\,
      O => key_num0(1)
    );
\key_num_delay_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \key_num[1]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_1\,
      D => \key_num_reg_n_0_[0]\,
      Q => key_num_delay(0)
    );
\key_num_delay_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \key_num[1]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_1\,
      D => \key_num_reg_n_0_[1]\,
      Q => key_num_delay(1)
    );
\key_num_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \key_num[1]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_1\,
      D => \key_num[0]_i_1_n_0\,
      Q => \key_num_reg_n_0_[0]\
    );
\key_num_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \key_num[1]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_1\,
      D => key_num0(1),
      Q => \key_num_reg_n_0_[1]\
    );
\kg_st[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF0008FF"
    )
        port map (
      I0 => cond_getWord(2),
      I1 => \kg_st[3]_i_6_n_0\,
      I2 => kg_st(2),
      I3 => kg_st(0),
      I4 => kg_st(1),
      I5 => kg_st(3),
      O => \kg_st[0]_i_1_n_0\
    );
\kg_st[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF000000FF70FF70"
    )
        port map (
      I0 => \kg_st[3]_i_6_n_0\,
      I1 => cond_getWord(2),
      I2 => kg_st(0),
      I3 => kg_st(2),
      I4 => \kg_st[3]_i_5_n_0\,
      I5 => kg_st(1),
      O => \kg_st[1]_i_1_n_0\
    );
\kg_st[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA2AA00AA00"
    )
        port map (
      I0 => \kg_st[3]_i_5_n_0\,
      I1 => \kg_st[3]_i_6_n_0\,
      I2 => kg_st(2),
      I3 => kg_st(1),
      I4 => cond_getWord(2),
      I5 => kg_st(0),
      O => \kg_st[2]_i_1_n_0\
    );
\kg_st[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAEAAAFFA"
    )
        port map (
      I0 => \kg_st[3]_i_3_n_0\,
      I1 => kg_st(1),
      I2 => kg_st(0),
      I3 => kg_st(2),
      I4 => kg_st(3),
      I5 => \kg_st[3]_i_4_n_0\,
      O => \kg_st[3]_i_1_n_0\
    );
\kg_st[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8880000B8B83030"
    )
        port map (
      I0 => \kg_st[3]_i_5_n_0\,
      I1 => kg_st(1),
      I2 => kg_st(0),
      I3 => cond_getWord(2),
      I4 => kg_st(2),
      I5 => \kg_st[3]_i_6_n_0\,
      O => \kg_st[3]_i_2_n_0\
    );
\kg_st[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000F80"
    )
        port map (
      I0 => subWord_cnt(1),
      I1 => subWord_cnt(0),
      I2 => kg_st(0),
      I3 => kg_st(1),
      I4 => kg_st(3),
      O => \kg_st[3]_i_3_n_0\
    );
\kg_st[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => kg_st(2),
      I1 => kg_st(3),
      I2 => key_num_delay(1),
      I3 => key_num_delay(0),
      I4 => \key_num_reg[0]_0\,
      O => \kg_st[3]_i_4_n_0\
    );
\kg_st[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000040FFFFFFFF"
    )
        port map (
      I0 => \kg_st[3]_i_7_n_0\,
      I1 => \round_reg_n_0_[3]\,
      I2 => \round_reg_n_0_[4]\,
      I3 => \round_reg_n_0_[6]\,
      I4 => \round_reg_n_0_[7]\,
      I5 => kg_st(3),
      O => \kg_st[3]_i_5_n_0\
    );
\kg_st[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cond_getWord(0),
      I1 => cond_getWord(1),
      O => \kg_st[3]_i_6_n_0\
    );
\kg_st[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => \round_reg_n_0_[0]\,
      I1 => \round_reg_n_0_[1]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[5]\,
      O => \kg_st[3]_i_7_n_0\
    );
\kg_st_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \kg_st[3]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_1\,
      D => \kg_st[0]_i_1_n_0\,
      Q => kg_st(0)
    );
\kg_st_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \kg_st[3]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_1\,
      D => \kg_st[1]_i_1_n_0\,
      Q => kg_st(1)
    );
\kg_st_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \kg_st[3]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_1\,
      D => \kg_st[2]_i_1_n_0\,
      Q => kg_st(2)
    );
\kg_st_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \kg_st[3]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_1\,
      D => \kg_st[3]_i_2_n_0\,
      Q => kg_st(3)
    );
\round[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => kg_st(1),
      I1 => kg_st(3),
      I2 => kg_st(2),
      I3 => \round_reg_n_0_[0]\,
      O => \round[0]_i_1_n_0\
    );
\round[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00808000"
    )
        port map (
      I0 => kg_st(1),
      I1 => kg_st(3),
      I2 => kg_st(2),
      I3 => \round_reg_n_0_[0]\,
      I4 => \round_reg_n_0_[1]\,
      O => \round[1]_i_1_n_0\
    );
\round[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \round[3]_i_2_n_0\,
      I1 => \round_reg_n_0_[1]\,
      I2 => \round_reg_n_0_[0]\,
      I3 => \round_reg_n_0_[2]\,
      O => \round[2]_i_1_n_0\
    );
\round[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F80FFFF"
    )
        port map (
      I0 => \round_reg_n_0_[0]\,
      I1 => \round_reg_n_0_[1]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[3]\,
      I4 => \round[3]_i_2_n_0\,
      O => \round[3]_i_1_n_0\
    );
\round[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => kg_st(2),
      I1 => kg_st(3),
      I2 => kg_st(1),
      I3 => kg_st(0),
      O => \round[3]_i_2_n_0\
    );
\round[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000088882888"
    )
        port map (
      I0 => \round[4]_i_2_n_0\,
      I1 => \round_reg_n_0_[4]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[3]\,
      I4 => \round[4]_i_3_n_0\,
      I5 => \round[7]_i_4_n_0\,
      O => \round[4]_i_1_n_0\
    );
\round[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => kg_st(3),
      I1 => kg_st(0),
      O => \round[4]_i_2_n_0\
    );
\round[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \round_reg_n_0_[1]\,
      I1 => \round_reg_n_0_[0]\,
      O => \round[4]_i_3_n_0\
    );
\round[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \round[5]_i_2_n_0\,
      I1 => \round[7]_i_3_n_0\,
      I2 => kg_st(2),
      I3 => kg_st(3),
      I4 => kg_st(1),
      O => \round[5]_i_1_n_0\
    );
\round[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \round_reg_n_0_[5]\,
      I1 => \round_reg_n_0_[3]\,
      I2 => \round_reg_n_0_[4]\,
      I3 => \round_reg_n_0_[1]\,
      I4 => \round_reg_n_0_[2]\,
      I5 => \round_reg_n_0_[0]\,
      O => \round[5]_i_2_n_0\
    );
\round[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"82000000"
    )
        port map (
      I0 => kg_st(3),
      I1 => \round_reg_n_0_[6]\,
      I2 => \round[7]_i_3_n_0\,
      I3 => kg_st(2),
      I4 => kg_st(1),
      O => \round[6]_i_1_n_0\
    );
\round[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4001"
    )
        port map (
      I0 => kg_st(0),
      I1 => kg_st(1),
      I2 => kg_st(3),
      I3 => kg_st(2),
      O => round
    );
\round[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008288"
    )
        port map (
      I0 => kg_st(3),
      I1 => \round_reg_n_0_[7]\,
      I2 => \round[7]_i_3_n_0\,
      I3 => \round_reg_n_0_[6]\,
      I4 => \round[7]_i_4_n_0\,
      O => \round[7]_i_2_n_0\
    );
\round[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \round_reg_n_0_[1]\,
      I1 => \round_reg_n_0_[0]\,
      I2 => \round_reg_n_0_[2]\,
      I3 => \round_reg_n_0_[5]\,
      I4 => \round_reg_n_0_[3]\,
      I5 => \round_reg_n_0_[4]\,
      O => \round[7]_i_3_n_0\
    );
\round[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => kg_st(2),
      I1 => kg_st(1),
      O => \round[7]_i_4_n_0\
    );
\round_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => round,
      CLR => \^s00_axi_aresetn_1\,
      D => \round[0]_i_1_n_0\,
      Q => \round_reg_n_0_[0]\
    );
\round_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => round,
      CLR => \^s00_axi_aresetn_1\,
      D => \round[1]_i_1_n_0\,
      Q => \round_reg_n_0_[1]\
    );
\round_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => round,
      CLR => \^s00_axi_aresetn_1\,
      D => \round[2]_i_1_n_0\,
      Q => \round_reg_n_0_[2]\
    );
\round_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => round,
      D => \round[3]_i_1_n_0\,
      PRE => \^s00_axi_aresetn_1\,
      Q => \round_reg_n_0_[3]\
    );
\round_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => round,
      CLR => \^s00_axi_aresetn_1\,
      D => \round[4]_i_1_n_0\,
      Q => \round_reg_n_0_[4]\
    );
\round_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => round,
      CLR => \^s00_axi_aresetn_1\,
      D => \round[5]_i_1_n_0\,
      Q => \round_reg_n_0_[5]\
    );
\round_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => round,
      CLR => \^s00_axi_aresetn_1\,
      D => \round[6]_i_1_n_0\,
      Q => \round_reg_n_0_[6]\
    );
\round_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => round,
      CLR => \^s00_axi_aresetn_1\,
      D => \round[7]_i_2_n_0\,
      Q => \round_reg_n_0_[7]\
    );
\slv_reg0[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A808A8000008A80"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => s00_axi_wdata(0),
      I2 => p_1_in(0),
      I3 => \key_num_reg[0]_0\,
      I4 => \^data1test\(0),
      I5 => slv_reg_wren,
      O => s00_axi_aresetn_0
    );
\subWord_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000400"
    )
        port map (
      I0 => subWord_cnt(0),
      I1 => kg_st(0),
      I2 => kg_st(1),
      I3 => kg_st(2),
      I4 => kg_st(3),
      O => \subWord_cnt[0]_i_1_n_0\
    );
\subWord_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000600000"
    )
        port map (
      I0 => subWord_cnt(0),
      I1 => subWord_cnt(1),
      I2 => kg_st(0),
      I3 => kg_st(1),
      I4 => kg_st(2),
      I5 => kg_st(3),
      O => \subWord_cnt[1]_i_1_n_0\
    );
\subWord_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => \subWord_cnt[0]_i_1_n_0\,
      Q => subWord_cnt(0)
    );
\subWord_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_1\,
      D => \subWord_cnt[1]_i_1_n_0\,
      Q => subWord_cnt(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_device is
  port (
    s00_axi_aresetn_0 : out STD_LOGIC;
    data1test : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn_1 : out STD_LOGIC;
    s00_axi_aresetn_2 : out STD_LOGIC;
    \p_0_in__0\ : out STD_LOGIC;
    \key_num_reg[0]\ : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 2 downto 0 );
    p_1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    slv_reg_wren : in STD_LOGIC;
    \ctrl_dataInR_reg[1]_0\ : in STD_LOGIC;
    \ctrl_dataInR_reg[0]_0\ : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_device;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_device is
  signal \ctrl_dataInR_reg_n_0_[0]\ : STD_LOGIC;
  signal encrypter_n_0 : STD_LOGIC;
  signal end_st_reg_delay : STD_LOGIC;
  signal end_st_reg_delay_i_1_n_0 : STD_LOGIC;
  signal mod_decrease_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \^p_0_in__0\ : STD_LOGIC;
begin
  \p_0_in__0\ <= \^p_0_in__0\;
\ctrl_dataInR_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^p_0_in__0\,
      D => \ctrl_dataInR_reg[0]_0\,
      Q => \ctrl_dataInR_reg_n_0_[0]\
    );
\ctrl_dataInR_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^p_0_in__0\,
      D => \ctrl_dataInR_reg[1]_0\,
      Q => p_0_in
    );
decrypter: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_dec
     port map (
      Q(0) => p_0_in,
      ctrl_dataIn_dec_reg_reg_0 => \^p_0_in__0\,
      data1test(0) => data1test(2),
      p_1_in(0) => p_1_in(0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => s00_axi_aresetn_1,
      s00_axi_wdata(0) => s00_axi_wdata(1),
      \slv_reg0_reg[1]\ => \ctrl_dataInR_reg[1]_0\,
      slv_reg_wren => slv_reg_wren
    );
encrypter: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_enc
     port map (
      \FSM_onehot_enc_st_reg[7]_0\ => \^p_0_in__0\,
      Q(0) => \ctrl_dataInR_reg_n_0_[0]\,
      data1test(0) => data1test(1),
      end_st_reg_delay => end_st_reg_delay,
      end_st_reg_delay_reg_0 => end_st_reg_delay_i_1_n_0,
      end_st_reg_reg_0 => encrypter_n_0,
      p_1_in(0) => p_1_in(0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => s00_axi_aresetn_2,
      s00_axi_wdata(0) => s00_axi_wdata(0),
      \slv_reg0_reg[0]\ => \ctrl_dataInR_reg[0]_0\,
      slv_reg_wren => slv_reg_wren
    );
end_st_reg_delay_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => encrypter_n_0,
      I1 => s00_axi_aresetn,
      I2 => end_st_reg_delay,
      O => end_st_reg_delay_i_1_n_0
    );
keygen: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_keygen
     port map (
      data1test(0) => data1test(3),
      \key_num_reg[0]_0\ => \key_num_reg[0]\,
      p_1_in(0) => p_1_in(0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => s00_axi_aresetn_0,
      s00_axi_aresetn_1 => \^p_0_in__0\,
      s00_axi_wdata(0) => s00_axi_wdata(2),
      slv_reg_wren => slv_reg_wren
    );
mod_decrease_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \ctrl_dataInR_reg_n_0_[0]\,
      I1 => \ctrl_dataInR_reg[0]_0\,
      I2 => p_0_in,
      I3 => \ctrl_dataInR_reg[1]_0\,
      O => mod_decrease_i_1_n_0
    );
mod_decrease_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^p_0_in__0\,
      D => mod_decrease_i_1_n_0,
      Q => data1test(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_v2_v1_0_S00_AXI is
  port (
    \slv_reg0_reg[2]_0\ : out STD_LOGIC;
    data1test : out STD_LOGIC_VECTOR ( 5 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    crtest : out STD_LOGIC_VECTOR ( 28 downto 0 );
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_v2_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_v2_v1_0_S00_AXI is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^crtest\ : STD_LOGIC_VECTOR ( 28 downto 0 );
  signal \^data1test\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal device_n_0 : STD_LOGIC;
  signal device_n_5 : STD_LOGIC;
  signal device_n_6 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^slv_reg0_reg[2]_0\ : STD_LOGIC;
  signal slv_reg_rden : STD_LOGIC;
  signal slv_reg_wren : STD_LOGIC;
  signal wr_data_fifo_i_1_n_0 : STD_LOGIC;
  signal wr_data_fifo_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_araddr[3]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \axi_rdata[0]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \axi_rdata[10]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \axi_rdata[11]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \axi_rdata[12]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \axi_rdata[13]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \axi_rdata[14]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \axi_rdata[15]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \axi_rdata[16]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \axi_rdata[17]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \axi_rdata[18]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \axi_rdata[19]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \axi_rdata[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \axi_rdata[20]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \axi_rdata[21]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \axi_rdata[22]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \axi_rdata[23]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \axi_rdata[24]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \axi_rdata[25]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \axi_rdata[26]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \axi_rdata[27]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \axi_rdata[28]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \axi_rdata[29]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \axi_rdata[2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \axi_rdata[30]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \axi_rdata[31]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \axi_rdata[3]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \axi_rdata[4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \axi_rdata[5]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \axi_rdata[6]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \axi_rdata[7]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \axi_rdata[8]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \axi_rdata[9]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair17";
begin
  D(0) <= \^d\(0);
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  crtest(28 downto 0) <= \^crtest\(28 downto 0);
  data1test(5 downto 0) <= \^data1test\(5 downto 0);
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  \slv_reg0_reg[2]_0\ <= \^slv_reg0_reg[2]_0\;
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0F8888FFFF8888"
    )
        port map (
      I0 => s00_axi_bready,
      I1 => \^s00_axi_bvalid\,
      I2 => s00_axi_wvalid,
      I3 => \^s_axi_awready\,
      I4 => aw_en_reg_n_0,
      I5 => s00_axi_awvalid,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => \p_0_in__0\
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => \p_0_in__0\
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => \p_0_in__0\
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => \p_0_in__0\
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_awvalid,
      I2 => aw_en_reg_n_0,
      I3 => \^s_axi_awready\,
      I4 => s00_axi_wvalid,
      I5 => p_0_in(0),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_awvalid,
      I2 => aw_en_reg_n_0,
      I3 => \^s_axi_awready\,
      I4 => s00_axi_wvalid,
      I5 => p_0_in(1),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => p_0_in(0),
      R => \p_0_in__0\
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => p_0_in(1),
      R => \p_0_in__0\
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => aw_en_reg_n_0,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_wvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => \p_0_in__0\
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7444444444444444"
    )
        port map (
      I0 => s00_axi_bready,
      I1 => \^s00_axi_bvalid\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      I4 => \^s_axi_awready\,
      I5 => \^s_axi_wready\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => \p_0_in__0\
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^data1test\(2),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(0)
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(7),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(8),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(9),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(10),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(11),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(12),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(13),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(14),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(15),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(16),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^d\(0),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(17),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(18),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(19),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(20),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(21),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(22),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(23),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(24),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(25),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(26),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^slv_reg0_reg[2]_0\,
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(27),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s_axi_arready\,
      O => slv_reg_rden
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(28),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(0),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(1),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(2),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(3),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(4),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(5),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^crtest\(6),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => reg_data_out(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => \p_0_in__0\
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => \p_0_in__0\
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => \p_0_in__0\
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => \p_0_in__0\
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => \p_0_in__0\
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => \p_0_in__0\
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => \p_0_in__0\
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => \p_0_in__0\
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => \p_0_in__0\
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => \p_0_in__0\
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => \p_0_in__0\
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => \p_0_in__0\
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => \p_0_in__0\
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => \p_0_in__0\
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => \p_0_in__0\
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => \p_0_in__0\
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => \p_0_in__0\
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => \p_0_in__0\
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => \p_0_in__0\
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => \p_0_in__0\
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => \p_0_in__0\
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => \p_0_in__0\
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => \p_0_in__0\
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => \p_0_in__0\
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => \p_0_in__0\
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => \p_0_in__0\
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => \p_0_in__0\
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => \p_0_in__0\
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => \p_0_in__0\
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => \p_0_in__0\
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => \p_0_in__0\
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => \p_0_in__0\
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5C50"
    )
        port map (
      I0 => s00_axi_rready,
      I1 => \^s_axi_arready\,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_arvalid,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => \p_0_in__0\
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => aw_en_reg_n_0,
      I2 => \^s_axi_wready\,
      I3 => s00_axi_wvalid,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s_axi_wready\,
      R => \p_0_in__0\
    );
device: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_device
     port map (
      \ctrl_dataInR_reg[0]_0\ => \^data1test\(2),
      \ctrl_dataInR_reg[1]_0\ => \^d\(0),
      data1test(3 downto 1) => \^data1test\(5 downto 3),
      data1test(0) => \^data1test\(1),
      \key_num_reg[0]\ => \^slv_reg0_reg[2]_0\,
      \p_0_in__0\ => \p_0_in__0\,
      p_1_in(0) => p_1_in(0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => device_n_0,
      s00_axi_aresetn_1 => device_n_5,
      s00_axi_aresetn_2 => device_n_6,
      s00_axi_wdata(2 downto 0) => s00_axi_wdata(2 downto 0),
      slv_reg_wren => slv_reg_wren
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => slv_reg_wren,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => slv_reg_wren,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => slv_reg_wren,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(3),
      O => p_1_in(31)
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^s_axi_awready\,
      I3 => \^s_axi_wready\,
      O => slv_reg_wren
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => slv_reg_wren,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(0),
      O => p_1_in(0)
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => device_n_6,
      Q => \^data1test\(2),
      R => '0'
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => \^crtest\(7),
      R => \p_0_in__0\
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => \^crtest\(8),
      R => \p_0_in__0\
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => \^crtest\(9),
      R => \p_0_in__0\
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => \^crtest\(10),
      R => \p_0_in__0\
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => \^crtest\(11),
      R => \p_0_in__0\
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => \^crtest\(12),
      R => \p_0_in__0\
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => \^crtest\(13),
      R => \p_0_in__0\
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => \^crtest\(14),
      R => \p_0_in__0\
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => \^crtest\(15),
      R => \p_0_in__0\
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => \^crtest\(16),
      R => \p_0_in__0\
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => device_n_5,
      Q => \^d\(0),
      R => '0'
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => \^crtest\(17),
      R => \p_0_in__0\
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => \^crtest\(18),
      R => \p_0_in__0\
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => \^crtest\(19),
      R => \p_0_in__0\
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => \^crtest\(20),
      R => \p_0_in__0\
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(24),
      Q => \^crtest\(21),
      R => \p_0_in__0\
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(25),
      Q => \^crtest\(22),
      R => \p_0_in__0\
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(26),
      Q => \^crtest\(23),
      R => \p_0_in__0\
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(27),
      Q => \^crtest\(24),
      R => \p_0_in__0\
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(28),
      Q => \^crtest\(25),
      R => \p_0_in__0\
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(29),
      Q => \^crtest\(26),
      R => \p_0_in__0\
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => device_n_0,
      Q => \^slv_reg0_reg[2]_0\,
      R => '0'
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(30),
      Q => \^crtest\(27),
      R => \p_0_in__0\
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(31),
      Q => \^crtest\(28),
      R => \p_0_in__0\
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(3),
      Q => \^crtest\(0),
      R => \p_0_in__0\
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(4),
      Q => \^crtest\(1),
      R => \p_0_in__0\
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(5),
      Q => \^crtest\(2),
      R => \p_0_in__0\
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(6),
      Q => \^crtest\(3),
      R => \p_0_in__0\
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(7),
      Q => \^crtest\(4),
      R => \p_0_in__0\
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => \^crtest\(5),
      R => \p_0_in__0\
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => \^crtest\(6),
      R => \p_0_in__0\
    );
wr_data_fifo_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C0AA"
    )
        port map (
      I0 => \^data1test\(0),
      I1 => wr_data_fifo_i_2_n_0,
      I2 => slv_reg_wren,
      I3 => s00_axi_aresetn,
      O => wr_data_fifo_i_1_n_0
    );
wr_data_fifo_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444440"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(1),
      I3 => s00_axi_wstrb(0),
      I4 => s00_axi_wstrb(3),
      I5 => s00_axi_wstrb(2),
      O => wr_data_fifo_i_2_n_0
    );
wr_data_fifo_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => wr_data_fifo_i_1_n_0,
      Q => \^data1test\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_v2_v1_0 is
  port (
    \slv_reg0_reg[2]\ : out STD_LOGIC;
    data1test : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \slv_reg0_reg[1]\ : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    crtest : out STD_LOGIC_VECTOR ( 28 downto 0 );
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_v2_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_v2_v1_0 is
begin
AES256_v2_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_v2_v1_0_S00_AXI
     port map (
      D(0) => \slv_reg0_reg[1]\,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WREADY => S_AXI_WREADY,
      crtest(28 downto 0) => crtest(28 downto 0),
      data1test(5 downto 0) => data1test(5 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      \slv_reg0_reg[2]_0\ => \slv_reg0_reg[2]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    crtest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    modetest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data1test : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "prueba_bd_AES256_v2_0_1,AES256_v2_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "AES256_v2_v1_0,Vivado 2020.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^crtest\ : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \^data1test\ : STD_LOGIC_VECTOR ( 6 downto 1 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN prueba_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 10, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN prueba_bd_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  crtest(31 downto 1) <= \^crtest\(31 downto 1);
  crtest(0) <= \^data1test\(3);
  data1test(31) <= \<const0>\;
  data1test(30) <= \<const0>\;
  data1test(29) <= \<const0>\;
  data1test(28) <= \<const0>\;
  data1test(27) <= \<const0>\;
  data1test(26) <= \<const0>\;
  data1test(25) <= \<const0>\;
  data1test(24) <= \<const0>\;
  data1test(23) <= \<const0>\;
  data1test(22) <= \<const0>\;
  data1test(21) <= \<const0>\;
  data1test(20) <= \<const0>\;
  data1test(19) <= \<const0>\;
  data1test(18) <= \<const0>\;
  data1test(17) <= \<const0>\;
  data1test(16) <= \<const0>\;
  data1test(15) <= \<const0>\;
  data1test(14) <= \<const0>\;
  data1test(13) <= \<const0>\;
  data1test(12) <= \<const0>\;
  data1test(11) <= \<const0>\;
  data1test(10) <= \<const0>\;
  data1test(9) <= \<const0>\;
  data1test(8) <= \<const0>\;
  data1test(7) <= \<const0>\;
  data1test(6 downto 1) <= \^data1test\(6 downto 1);
  data1test(0) <= \<const0>\;
  modetest(31) <= \<const0>\;
  modetest(30) <= \<const0>\;
  modetest(29) <= \<const0>\;
  modetest(28) <= \<const0>\;
  modetest(27) <= \<const0>\;
  modetest(26) <= \<const0>\;
  modetest(25) <= \<const0>\;
  modetest(24) <= \<const0>\;
  modetest(23) <= \<const0>\;
  modetest(22) <= \<const0>\;
  modetest(21) <= \<const0>\;
  modetest(20) <= \<const0>\;
  modetest(19) <= \<const0>\;
  modetest(18) <= \<const0>\;
  modetest(17) <= \<const0>\;
  modetest(16) <= \<const0>\;
  modetest(15) <= \<const0>\;
  modetest(14) <= \<const0>\;
  modetest(13) <= \<const0>\;
  modetest(12) <= \<const0>\;
  modetest(11) <= \<const0>\;
  modetest(10) <= \<const0>\;
  modetest(9) <= \<const0>\;
  modetest(8) <= \<const0>\;
  modetest(7) <= \<const0>\;
  modetest(6) <= \<const0>\;
  modetest(5) <= \<const0>\;
  modetest(4) <= \<const0>\;
  modetest(3) <= \<const0>\;
  modetest(2) <= \<const0>\;
  modetest(1) <= \<const0>\;
  modetest(0) <= \<const0>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AES256_v2_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      S_AXI_WREADY => s00_axi_wready,
      crtest(28 downto 0) => \^crtest\(31 downto 3),
      data1test(5 downto 0) => \^data1test\(6 downto 1),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      \slv_reg0_reg[1]\ => \^crtest\(1),
      \slv_reg0_reg[2]\ => \^crtest\(2)
    );
end STRUCTURE;
