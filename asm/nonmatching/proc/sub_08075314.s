	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075314
sub_08075314: @ 0x08075314
	push {lr}
	ldr r0, _08075330 @ =gUnknown_081D1398
	ldr r1, _08075334 @ =0x06000800
	bl sub_08011CAC
	ldr r0, _08075338 @ =gUnknown_081D13E0
	ldr r1, _0807533C @ =gUnknown_0849957C
	ldr r1, [r1]
	bl sub_08011CAC
	bl sub_08013AFC
	pop {r0}
	bx r0
	.align 2, 0
_08075330: .4byte gUnknown_081D1398
_08075334: .4byte 0x06000800
_08075338: .4byte gUnknown_081D13E0
_0807533C: .4byte gUnknown_0849957C

