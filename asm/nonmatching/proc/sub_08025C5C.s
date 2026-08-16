	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025C5C
sub_08025C5C: @ 0x08025C5C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	bl sub_08025AEC
	adds r4, r0, #0
	cmp r4, #0
	beq _08025C90
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl sub_08025BE0
	strb r7, [r4, #2]
	strb r6, [r4, #3]
	ldr r0, _08025C8C @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_08025D20
	adds r0, r4, #0
	b _08025C92
	.align 2, 0
_08025C8C: .4byte gUnknown_030033EC
_08025C90:
	movs r0, #0
_08025C92:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

