#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��bacme.sh �mWW��ί��M���� e�x�փ����T�nOw�N&7a��tff�hE�AEĂ�J��*���͝$���ܹ3��`�vKS���<�}�_���7BYED���q�{�?[�ۿl��N��"%�+K��TDYu��p���BX�א�oo 2'a��7��u���m���XQ������e7 �Kcp��$�_��D|`/;���� ��/Q���HP1jE��z�-�V��wuM3����T��t��d����𐧀��lrr!�BؔB��~�t�`��@p2���9�|VM��9� �$�M6�F���D�WH8��Q�E���q�-�F*�R�T�clyw4$��a�t�LH~gђ�&��nȚ�?H�=�]�=�W��K���5�jM�6���e2�->��/�O��G'���6_g�K�2�e�lŝb2�űy\�u�_����8r���'�L#!~�c_h ��R�|��F��E�`��F��0�48~�}��5�(�.�oB�4n��"�4@Y�C��o�û!r���z�4�@�W��ɉB>o��*��*p��Qrv���c��;=��D��`H�8iĒ��4`*��4�C�͠���[L��h�� NW��A4!�!�i���
�] ���"�ΖV�
��gS2��xϘ���{�����$Y=S�t�}�Н��
/n��k$���@���B�	��G�����C�f;@��t�l�&��)���<M���d]�K�dI�	�2]-+_�f�¨�D��>�*T屫֙���!w~,�t�wz~����G_>����-8��1Yܸϐ�S��F�d�ڍ��k⾗�A��ҽ1P��Xa؞'�D�����@:ĩ��Ǒ�������.,K����Qǅ� L.n��ǟ�cq��I�	�o�Hn�<{R�Y��d�٘���א�zL V��Yrv���~W8��u*�����Cr��55]��C���4�B��l��"AIK�lI�0I��&��
!c�g��{4�������D{��%غ=j�|�xa����1�b��݁�RJW f:�ޱCCC��*�㥨*Hq9dꢄ�0���!QO�w)e"!�A���HwTHw�>�,��y��5��ᤒ2����_����	SĦ�r��������£���y�Hh�s�E.�1����>!��WAoF�0qB2d�0�J�����p��!�v�@�M� - �`��ڮ��d0n�p�t�l;���( �7�d+�o7V{�>�D��J����<9�U���~��S�6�����ᮎ��]R��nk�uu��n�eh� �P���ڄM���V�T�YI~T��k��c�-�k�|Ԛٲ&F����U2u�t�4��թ;&�xHT�h�2(��Ԫ���1����`�1M�hZ���y�j� 麁�>�{���Q����`�Ѫ�C�~p��֧ǎ6D2��������Cȷ���b3&+&օ$m�@��q{eϧb�H����WRQ`�bh1ڗu��:�:�A����[���[��z@�KZ�8r7��r�칪s�6,�=��H� ����ʿh�3l�7�����3BI���\p��(�'/ơ�n�~�%S眆��G��f:���ҩD�;��b�������C3���ХjT�6.MU��Q����GY5LpT��Р���v��M6q�CSi�2�k=^&g&���Q�}�or�܏Po��+m�+=}LUf�t�rn����tin�:�O���ӊƣ�����a'��\?S��}����y�x�0ND�3@/N��PX�<�1�� ��>�����`��s�g�h�;����͠c,8����9�a��R4���$�K���.�۠"AH%���Q��N�����囹ge��W֥t�(�����#Z������0�E5�P���$x$'�Dɡ���n�W,���H�?V��pi��S���I_��|��p�\w���l�o��d�@^(2�d.�*���?���BN�#� n�FEES�� KB�{�t��(�V%=����F�w�
�;�aQ���0�Y�L�	�Ⱥ��3�A�^��ں�J�ș9艠/�ƚu�����`�H�o���Z���_�Eöo��`�����j	o;��� ����w���w:��C��>a;Da�ۧ���7:�Y2��<�����wƯ�J����t#b��dm��?]ظ����'����B~�<7}�������bi�"����Vq3G�'��g*紱s���!��3�3��*#�����)�P��>�7���l�d�$�ԣ���1W��eNE?�)����g��K�l����H�"�������qR�G�?��ɤ2�:k��`����Ź<ټRE�#�-���@���,�����ղ���גB�$@?����`�J>������כL�I�����6��g�SYW%�k�i�k��rIbR?��.�K�w��k�l��z����ճ�|g���1>�jK�U����rp�}�F<v�)lهn�'�����ޘu�Nyf�<{B2K�;^��ݣ����u����'�k[�;,����򕈝�qk�1���=�����jMM�NB��q'�j�m���"��@��dMlA�6�����Uqh��N��:�}g�4n*/�\�X�Ch)�W���?�k��Vf75���1�:y�w�c�����E.K������B�S'T �]/mn:�E�ݳY��\9�b�y<��Ռ�`QwC����ãʏw'�N�/lG�/��������nv��w�#��	U=:��@E#5��ymJ�!sM �rV?�l^�?�����ވ�&�5�U������R�UH>�vྖ�:=V)��I^�����ꈦ*�f����s���pY˛��#n�׈��BT[�N��;��/M�{���;��`�A���7=|5|D��q���<�ݢ���]6��I�j0��RGS\�u�<v�b�7/i-e�"{�b���o��9�-#�OrG�(D�{��Û�{>9���k����y@�WX���ۛ)��W��ڂf���-uk:.6�����	5M��F;И8O/?�n�	TG�TX-��(���ʦV|k�y-��xi��K�R��Y�
��T"��^5�29���
�-�HVYj�����ǵ�W� +�Φݩ�s<{U�߆g�Gn�5D����WD�u��$��$  