	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063814
sub_08063814: @ 0x08063814
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0x1d
	ldr r0, _08063840 @ =gUnknown_03001470
	movs r1, #0xae
	lsls r1, r1, #4
	adds r5, r0, r1
_08063822:
	ldr r0, [r5]
	cmp r0, r6
	beq _08063830
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_08015328
_08063830:
	subs r5, #0x60
	subs r4, #1
	cmp r4, #0
	bge _08063822
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063840: .4byte gUnknown_03001470

