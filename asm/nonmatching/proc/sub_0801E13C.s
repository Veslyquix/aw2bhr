	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E13C
sub_0801E13C: @ 0x0801E13C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r6, _0801E160 @ =gUnknown_030024F0
	ldr r0, _0801E164 @ =gUnknown_0200F720
	adds r3, r0, #6
	movs r5, #1
_0801E148:
	adds r2, r4, r6
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E168
	ldrb r0, [r2]
	strb r5, [r2]
	strh r1, [r3]
	strh r1, [r3, #6]
	adds r0, r4, #0
	b _0801E174
	.align 2, 0
_0801E160: .4byte gUnknown_030024F0
_0801E164: .4byte gUnknown_0200F720
_0801E168:
	adds r3, #0x10
	adds r4, #1
	cmp r4, #0x1f
	ble _0801E148
	movs r0, #1
	rsbs r0, r0, #0
_0801E174:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

