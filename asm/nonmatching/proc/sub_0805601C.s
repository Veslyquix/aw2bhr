	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805601C
sub_0805601C: @ 0x0805601C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r3, _08056074 @ =gUnknown_03004580
	lsls r1, r4, #4
	adds r0, r3, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #1
	bne _0805608C
	ldr r2, _08056078 @ =gUnknown_085D6A48
	adds r0, r3, #2
	adds r0, r1, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #4
	beq _08056060
	cmp r0, #6
	beq _08056060
	cmp r0, #1
	beq _08056060
	cmp r0, #7
	bne _0805607C
_08056060:
	movs r0, #1
	adds r1, r4, #0
	eors r1, r0
	str r7, [sp]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #2
	bl sub_080560A4
	b _0805609A
	.align 2, 0
_08056074: .4byte gUnknown_03004580
_08056078: .4byte gUnknown_085D6A48
_0805607C:
	movs r0, #1
	adds r1, r4, #0
	eors r1, r0
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_0805634C
	b _0805609A
_0805608C:
	movs r0, #1
	adds r1, r4, #0
	eors r1, r0
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_0805634C
_0805609A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

