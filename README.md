# HDL の使い方

1. 必要なモジュール・シミュレート用モジュールを書く
1. `$ iverilog -o adder.out adder.v adder_tp.v`でコンパイル(この時、 -s オプションで，トップモジュール名を指定します。 -s オプションは省略可能であるが，作者は -s オプションにてトップモジュール名を明記することを奨励しています。)
1. `vpp`コマンドでシミュレーションの実行 `$ vvp adder.out`
   ここで、

```
# adder.v
initial begin
$monitor( $stime, " a=%h b=%h q=%h",a,b,q);
$dumpfile("tb_Prpg10.vcd"); # 出力するvcdファイル
$dumpvars(0, adder); # 波形表示させるモジュールを指定
end
```

のように\$dumpfile / \$dumpvars を入れないとのちにつかう vcd ファイルが出力されないから注意！

4. `$ gtkwave tb_Prpg10.vcd`で波形を表示だ！

## 参考サイト

http://cas.eedept.kobe-u.ac.jp/~arai/Verilog/chap4.html
https://sites.google.com/site/methingh/fpga-asic-bei-wang-lu/-gktwave-no-shi-yong-fang-fa
http://www.usamilab.ise.shibaura-it.ac.jp/adv1a-fpga-tutorial/docs/intro-02/
http://altmo.html.xdomain.jp/src_00/2015_0100/00.html
https://tech.sairilab.com/2018/09/macdeverilogno-kai-fa-huan-jing-gou-zhu/
[Icarus のインストール](http://bleyer.org/icarus/)
