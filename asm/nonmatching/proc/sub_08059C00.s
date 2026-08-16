	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059C00
sub_08059C00: @ 0x08059C00
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r4, _08059C44 @ =0x00007FFF
	movs r6, #0
	ldrh r1, [r2, #2]
	movs r3, #2
	ldrsh r0, [r2, r3]
	movs r3, #1
	rsbs r3, r3, #0
	cmp r0, r3
	beq _08059C30
_08059C18:
	lsls r1, r1, #0x10
	lsls r0, r4, #0x10
	cmp r1, r0
	bgt _08059C24
	ldrh r4, [r2, #2]
	adds r6, r2, #0
_08059C24:
	adds r2, #4
	ldrh r1, [r2, #2]
	movs r7, #2
	ldrsh r0, [r2, r7]
	cmp r0, r3
	bne _08059C18
_08059C30:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	ldr r2, _08059C44 @ =0x00007FFF
	adds r3, r0, #0
	cmp r1, r2
	bne _08059C4C
	ldr r0, _08059C48 @ =0x0000270F
	strh r0, [r5]
	b _08059C56
	.align 2, 0
_08059C44: .4byte 0x00007FFF
_08059C48: .4byte 0x0000270F
_08059C4C:
	strh r2, [r6, #2]
	ldrb r0, [r6]
	strh r0, [r5]
	ldrb r0, [r6, #1]
	strh r0, [r5, #2]
_08059C56:
	asrs r0, r3, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

