	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BEA0
sub_0805BEA0: @ 0x0805BEA0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	ldr r1, _0805BEE4 @ =gUnknown_030013EC
	ldr r0, _0805BEE8 @ =gUnknown_030046D4
	ldr r2, [r0]
	ldr r0, _0805BEEC @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r3, [r0, #0xf]
	movs r0, #0
	str r0, [sp]
	ldr r4, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	bl _call_via_r4
	bl sub_080583DC
	adds r4, r0, #0
	cmp r4, #0
	beq _0805BEDC
	bl sub_08058254
	adds r1, r4, #5
	cmp r0, r1
	bge _0805BEDC
	strh r6, [r5]
	strh r7, [r5, #2]
_0805BEDC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEE4: .4byte gUnknown_030013EC
_0805BEE8: .4byte gUnknown_030046D4
_0805BEEC: .4byte gUnknown_085766E0

