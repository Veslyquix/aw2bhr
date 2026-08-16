	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080780A0
sub_080780A0: @ 0x080780A0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803BD6C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080780BA
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080780C4
_080780BA:
	bl sub_0801C1F8
	ldr r1, _080780CC @ =gUnknown_0202FDFC
	movs r0, #0
	strb r0, [r1, #0x10]
_080780C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080780CC: .4byte gUnknown_0202FDFC

