
clean:
	rm -rf build dist venv rubikscubennnsolver.egg-info cache ida_search ida_search_via_graph my-pt-states.txt
	find . -name __pycache__ | xargs rm -rf

init: clean
	gcc -O3 -o ida_search rubikscubennnsolver/ida_search_core.c rubikscubennnsolver/ida_search.c rubikscubennnsolver/rotate_xxx.c rubikscubennnsolver/ida_search_666.c rubikscubennnsolver/ida_search_777.c -lm
	gcc -O3 -o ida_search_via_graph rubikscubennnsolver/ida_search_core.c rubikscubennnsolver/ida_search_via_graph.c -lm
	python3 -m venv venv
	@./venv/bin/python3 -m pip install -U pip==20.3.1
	@./venv/bin/python3 -m pip install -r requirements.dev.txt
	@./venv/bin/python3 -m pre_commit install --install-hooks --overwrite
	@./venv/bin/python3 -m pip check

format:
	isort rubikscubennnsolver usr utils
	@./venv/bin/python3 -m black --config=pyproject.toml .
	@./venv/bin/python3 -m flake8 --config=.flake8

wheel:
	@./venv/bin/python3 setup.py bdist_wheel

test:
	./rubiks-cube-solver.py --state DLRRFULLDUBFDURDBFBRBLFU
	./rubiks-cube-solver.py --state RRBBUFBFBRLRRRFRDDURUBFBBRFLUDUDFLLFFLLLLDFBDDDUUBDLUU
	./rubiks-cube-solver.py --state BRBLLLBRDLBBDDRRFUDFUDUDFUDDDRURBBBUUDRLFRDLLFBRFLRFLFFFBRULDRUBUBBLDBFRDLLUBUDDULFLRRFLFUBFUFUR
	./rubiks-cube-solver.py --state RFFFUDUDURBFULULFDBLRLDUFDBLUBBBDDURLRDRFRUDDBFUFLFURRLDFRRRUBFUUDUFLLBLBBULDDRRUFUUUBUDFFDRFLRBBLRFDLLUUBBRFRFRLLBFRLBRRFRBDLLDDFBLRDLFBBBLBLBDUUFDDD
	./rubiks-cube-solver.py --state FBDDDFFUDRFBBLFLLURLDLLUFBLRFDUFLBLLFBFLRRBBFDRRDUBUFRBUBRDLUBFDRLBBRLRUFLBRBDUDFFFDBLUDBBLRDFUUDLBBBRRDRUDLBLDFRUDLLFFUUBFBUUFDLRUDUDBRRBBUFFDRRRDBULRRURULFDBRRULDDRUUULBLLFDFRRFDURFFLDUUBRUFDRFUBLDFULFBFDDUDLBLLRBL
	./rubiks-cube-solver.py --state DBDBDDFBDDLUBDLFRFRBRLLDUFFDUFRBRDFDRUFDFDRDBDBULDBDBDBUFBUFFFULLFLDURRBBRRBRLFUUUDUURBRDUUURFFFLRFLRLDLBUFRLDLDFLLFBDFUFRFFUUUFURDRFULBRFURRBUDDRBDLLRLDLLDLUURFRFBUBURBRUDBDDLRBULBULUBDBBUDRBLFFBLRBURRUFULBRLFDUFDDBULBRLBUFULUDDLLDFRDRDBBFBUBBFLFFRRUFFRLRRDRULLLFRLFULBLLBBBLDFDBRBFDULLULRFDBR
	./rubiks-cube-solver.py --state ULBDLDBUFRBBBBBLBFFFDFRFBBDDFDFRFFLDLDLURRBUDRRBFLUDFRLBDURULRUUDBBBUBRURRRLDLRFFUFFFURRFBLLRRFLFUDBDRRDFULLLURFBFUUBDBBDBFLFDFUUFDUBRLUFDBLRFLUDUFBFDULDFRUBLBBBUBRRDBDDDDFURFLRDBRRLLRFUFLRDFDUULRRDULFDUDRFLBFRLDUDBDFLDBDUFULULLLBUUFDFFDBBBRBRLFLUFLFUFFRLLLFLBUDRRFDDUDLFLBRDULFLBLLULFLDLUULBUDRDFLUDDLLRBLUBBRFRRLDRDUUFLDDFUFLBDBBLBURBBRRRFUBLBRBRUBFFDBBBBLBUFBLURBLDRFLFBUDDFFRFFRLBDBDUURBUFBDFFFLFBDLDUFFBRDLBRLRLBFRUUUULRRBDBRRFDLLRRUUBDBDBFDLRDDBRUUUUUBLLURBDFUFLLRDBLRRBBLBDDBBFUDUDLDLUFDDDUURBFUFRRBLLURDDRURRURLBLDRFRUFBDRULUFFDUDLBBUURFDUDBLRRUDFRLLDULFUBFDLURFBFULFLRRRRRFDDDLFDDRUFRRLBLUBU
