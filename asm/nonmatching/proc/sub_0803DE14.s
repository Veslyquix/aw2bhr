	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803DE14
sub_0803DE14: @ 0x0803DE14
	push {r4, r5, r6, r7, lr}
	movs r0, #0x39
	rsbs r0, r0, #0
	mov ip, r0
	movs r7, #8
	rsbs r7, r7, #0
	movs r3, #0
	ldr r2, _0803DE60 @ =gUnknown_02028360
	ldr r6, _0803DE64 @ =0xFFFFFC3F
	movs r5, #0x3d
	rsbs r5, r5, #0
	movs r4, #0xf
_0803DE2C:
	ldrb r1, [r2, #2]
	mov r0, ip
	ands r0, r1
	ands r0, r7
	strb r0, [r2, #2]
	strb r3, [r2, #1]
	strb r3, [r2]
	ldrh r1, [r2, #2]
	adds r0, r6, #0
	ands r0, r1
	strh r0, [r2, #2]
	strb r3, [r2, #4]
	strb r3, [r2, #5]
	ldrb r1, [r2, #3]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2, #3]
	strb r3, [r2, #6]
	strb r3, [r2, #7]
	adds r2, #8
	subs r4, #1
	cmp r4, #0
	bge _0803DE2C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DE60: .4byte gUnknown_02028360
_0803DE64: .4byte 0xFFFFFC3F

