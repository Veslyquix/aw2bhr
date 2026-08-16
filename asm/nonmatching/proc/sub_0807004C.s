	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807004C
sub_0807004C: @ 0x0807004C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r1, [r5]
	movs r0, #0x80
	tst r0, r1
	beq _08070084
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08070082
	movs r6, #0
_08070060:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0807007A
	ldrb r0, [r4, #1]
	movs r3, #7
	ands r0, r3
	beq _08070078
	ldr r3, _0807008C @ =gUnknown_03007FF0
	ldr r3, [r3]
	ldr r3, [r3, #0x2c]
	bl sub_0807003C
_08070078:
	strb r6, [r4]
_0807007A:
	str r6, [r4, #0x2c]
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _08070060
_08070082:
	str r4, [r5, #0x20]
_08070084:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807008C: .4byte gUnknown_03007FF0

