	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049D88
sub_08049D88: @ 0x08049D88
	push {r4, lr}
	ldr r1, _08049DD8 @ =gUnknown_02028E3D
	movs r0, #0
	strb r0, [r1]
	bl sub_0801F494
	ldr r4, _08049DDC @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl sub_08011CAC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl sub_08027FBC
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	bl sub_08027FBC
	adds r0, r4, #0
	movs r1, #2
	movs r2, #2
	bl sub_08027FBC
	adds r0, r4, #0
	movs r1, #3
	movs r2, #3
	bl sub_08027FBC
	ldr r0, _08049DE0 @ =gUnknown_081268B8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049DD8: .4byte gUnknown_02028E3D
_08049DDC: .4byte gUnknown_0200FC50
_08049DE0: .4byte gUnknown_081268B8

