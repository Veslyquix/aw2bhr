	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070AF8
sub_08070AF8: @ 0x08070AF8
	push {r4, lr}
	ldr r0, _08070B28 @ =gUnknown_03007FF0
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _08070B2C @ =0x68736D53
	cmp r3, r0
	beq _08070B20
	ldr r0, _08070B30 @ =0x040000C6
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r1, r4, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldrb r0, [r2, #4]
	movs r0, #0
	strb r0, [r2, #4]
	adds r0, r3, #0
	subs r0, #0xa
	str r0, [r2]
_08070B20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070B28: .4byte gUnknown_03007FF0
_08070B2C: .4byte 0x68736D53
_08070B30: .4byte 0x040000C6

