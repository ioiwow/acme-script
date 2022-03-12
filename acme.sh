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
�^,bacme.sh �mWW��ί��M���� e�xh�A����r�������d�0�Ig&`V�V$(T@Q,���JB�U$���͝I>���sg&�^���."�����������HJ(�뽌&F;���@K˗����HDN���VXJʼ��K�g�7�A�Ы"ND���)@8;���!&���� ��1xZ�eu�|Kc��^����1�&��$'�K"6�����0�Ģ@3�}�%
>�}q�����Bo��\�R�I�����a����&KϧJ�&Jg���X(��f�<\�DC��zy��DY�uPDF��0�B�%*����(�A�7�1I�S"D��$�F�a�I����W�Z����p�")�H��8A���C���H7H�dw-��B�_�tIU��vF�gwF�2�uI� ���5����Hqso^��Y�Q�*,�x6>T7/�P�|nM�P�ަ�MQQX�C�$����F:)"��S�&�9S	>it�߈K�C���� K�G��&�gЋ ������Y#����87^�=
��옵q���Wm�?J%��!t_%E7xY�&.'�^^��c�u~v�б�ǿ�8�Fq�S} �K�Df�")����!��;�HPAI��=do()Yv�k� }� 
xԘ!���Ba�N����/�%�������<��P����B�<;Y��U����xl�&���䷺XO�D�$k#^H�A�� yttN�o��'�G�ޖhA�����C!)��MLke��~�IY�B���J��s��z��7��|w�gm�EN��>�U��V�'+|B�Eb5�����wۅf�=��ko���䨫rPP�-�"��&������L��e	�>*_]-_{h���Ks�U���[���9?n����ۥ{gqf��uCL��tCM������h�0(	"z�s+�7¾QI�#���3�!*1UHݨ�L�<T�{R� �:	��='��ή��=ǫ6�|��睟j��ɉ�`��#UK	^���[����5�_���C�݊)�Q �Ⱥ#�����4��#���۴�'�{����}�]�L�.��������xt�<v������>��LR��}���;�v�yh� N��)�(Q�{�l��uq�i"��GKwG�[7K�����NL�H��C��>��P�jO���&��v��u�.��V�	0xy~غ~��m�����YRXi�n�ɣ��1��؏���5�`f�Js���/�.���g�Y�)�5�=�tBߑ�|�P;NQ�[��E���;:�eDU(̵�b詎 ���)"Q�vY��{<㩬uo�pȲ����\�4���NG!��ugct5E���P�d`M`�D"m`�Er�r\*��(��#̻�u:/ݻm~?E�-3��`��E��kOR��v ��+0��0U�k����ڑ�$R*�z_Jv�����1���`��G�4���N���)qI9���i�W�u4.)�~ō	�^��9ɬ��P^Z�],UR�P;mX�(
�I'�`l�DyY����F�k~��,��$��.*��NĿ���;�o��هEY�¥p�mv���6���Id^]4g2Ng�{a�/�y-����[��9s��u+gff����:��q�\��y��;<>���ޙ�hG�3�l;�Hi;��%�֒���H�Q���̢�[�6oq�"�'���;�Y<�<�e� .l�r9|�����=����ovyQ��&˅�ōK����?6�G��幩CG�5�>g�q�0[���%��\)�em��Ԅ5u�B��ҡ����<5%5"K���L�b&i�&<P�o��nP���#���#ŧw�tL
���Q#�t&�dA&zҜ}
gX_��w�8�
�CY��2���F�iȖv~Ĉ���f��#'a���u�֚+�͙*d�v8�c~��]Gh!� =l6��/��<�����e�d�O
1_���7����s�I��ߔ�6���.TiU�,�K�}b��I�ӓ�A�C�e،A����A��@�� +0B�(��S��H&��5P�!P���'V����68��t�m�GV��<	Sj4;(�0��{~�[��z.h���	�����>*d��CHVx�8 e��c��c|�)�|��8Mw e�Io�uS���[7~6/.���2e���Fy�؀����c�����^�j��j�|����>�v�.����@(�t�E���P����R~�_�@�,L
�:������	:���Kǃb*�jq5�[�� �ίTZ���* Ɨ6	}������w�7�]�O�V}&S'�Ƅ_'��@$5�0��c]����Fr�k���dF���=��7n5L]���+���T�j�ҨKFo*BZ���;�9]�`N���[���{n.�}�X�.��	�b��,f .Ī/K�<�A_�L�
'ĥ���݁9�� �%ݩ%���DQW]��2�4'�������`RN�$-��m�u/-�n�h�M�P���h'�y�=PV�47xl��l^\�ټ���'uW+q��$�}@��n�&H*���V��Yh�,�Ⱦ��G3�틟=��a<��f����2�9�L��uAn�bLж�9�e���7���#�T�Q�w���sq[h�9���?�o��F�a��ywļ|�<=� g�sw�i���4u~5��!��CV0�mYw6<X�`t6���s��3���|�s�د�U�?���v&��םq�a��6�_�"��E��F����-���7���cQi�G�����s��7G6.�gl��DE�r��j�/��{
h�otz�ZӒ�AfM)���?߬;^k�vA��h	�i1r���/�.���s�pv�������������l�>�}2!*)�PAy��o^��*_ާl������u�ү���m�3��N���I�P-����^�_�3�����μn��!s�@�]�~uټTO��㝕��ވ�m�k֫6j9��ӅߣZ��xڅ�Z���X��z'y)��R�*۪d������kL������6t����X�jK�i�U��c\:�|h�-�[O�9c���A�����j<.j8{�<�Ȳ�Tr���j�x*"��.�G��d�H�)�L��ŭ��C�-7�NrG�(D廳�[�]�_B�@?2*����}���5��~ѻP�v�b�D��r)���pm�J�Th�)���ć�p�_ T�M�6P�ADk����a�_x���?t>�G�n����h3kx�*�=GS���u+ɔ��}؀o�E�BSc5ٵ��A�}���8�v����mx��?qҬ���"�ؘ��@��7Wx�%  