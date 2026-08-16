	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053820
sub_08053820: @ 0x08053820
	push {r4, lr}
	ldr r4, _0805385C @ =gUnknown_02029664
	ldrb r1, [r4]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _0805383A
	bl sub_08053860
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
_0805383A:
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	movs r1, #0xd0
	ands r0, r1
	cmp r0, #0x50
	bne _08053856
	bl sub_08053BB8
	ldrb r0, [r4]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4]
_08053856:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805385C: .4byte gUnknown_02029664

