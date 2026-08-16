	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078270
sub_08078270: @ 0x08078270
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08078290 @ =gUnknown_0202FDFC
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	bl sub_08075E68
	ldr r0, [r4, #0xc]
	cmp r0, #0xf
	beq _080782A6
	cmp r0, #0xf
	bgt _08078294
	cmp r0, #7
	beq _0807829C
	b _080782B0
	.align 2, 0
_08078290: .4byte gUnknown_0202FDFC
_08078294:
	cmp r0, #0x17
	beq _080782A6
	cmp r0, #0x29
	bne _080782B0
_0807829C:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _080782B8
_080782A6:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _080782B8
_080782B0:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080782B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

