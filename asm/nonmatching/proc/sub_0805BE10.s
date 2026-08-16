	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BE10
sub_0805BE10: @ 0x0805BE10
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	ldr r1, _0805BE4C @ =gUnknown_030013EC
	ldr r0, _0805BE50 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r3, [r0, #0xf]
	movs r0, #0
	str r0, [sp]
	ldr r4, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	bl _call_via_r4
	bl sub_08058318
	adds r4, r0, #0
	bl sub_0805848C
	cmp r4, r0
	bge _0805BE44
	strh r6, [r5]
	strh r7, [r5, #2]
_0805BE44:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE4C: .4byte gUnknown_030013EC
_0805BE50: .4byte gUnknown_085766E0

