	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077EDC
sub_08077EDC: @ 0x08077EDC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _08077F18 @ =gUnknown_08615194
	ldr r0, _08077F1C @ =gUnknown_0202FDFC
	ldr r0, [r0, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r0, r2, #0
	adds r0, #0x14
	adds r0, r1, r0
	ldr r4, [r0]
	adds r2, #0x2c
	adds r1, r1, r2
	ldr r1, [r1]
	cmp r4, #0
	beq _08077F28
	cmp r1, #0
	beq _08077F20
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08077F28
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08078540
	b _08077F28
	.align 2, 0
_08077F18: .4byte gUnknown_08615194
_08077F1C: .4byte gUnknown_0202FDFC
_08077F20:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08078540
_08077F28:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

