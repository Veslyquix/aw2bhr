	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014DCC
sub_08014DCC: @ 0x08014DCC
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	adds r2, r0, #0
	adds r1, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r1, r0
	adds r7, r1, #0
	adds r7, #0x10
	movs r4, #0
	movs r6, #0
	cmp r1, #0
	bne _08014DEA
	b _08014E3A
_08014DE8:
	adds r2, r3, #0
_08014DEA:
	ldr r0, [r2, #8]
	cmp r0, #0
	bne _08014E04
	ldr r0, [r2, #4]
	cmp r0, r1
	blo _08014E04
	cmp r4, r0
	bhi _08014DFE
	cmp r4, #0
	bne _08014E04
_08014DFE:
	adds r5, r2, #0
	adds r4, r0, #0
	ldr r6, [r5]
_08014E04:
	ldr r3, [r2]
	cmp r3, #0
	bne _08014DE8
	cmp r4, #0
	beq _08014E3A
	adds r0, r1, #0
	adds r0, #0x20
	cmp r4, r0
	blo _08014E2C
	adds r0, r5, r7
	str r0, [r5]
	str r1, [r5, #4]
	movs r1, #1
	str r1, [r5, #8]
	adds r2, r0, #0
	str r6, [r2]
	subs r0, r4, r7
	str r0, [r2, #4]
	str r3, [r2, #8]
	b _08014E34
_08014E2C:
	str r6, [r5]
	str r4, [r5, #4]
	movs r0, #1
	str r0, [r5, #8]
_08014E34:
	adds r0, r5, #0
	adds r0, #0x10
	b _08014E3C
_08014E3A:
	movs r0, #0
_08014E3C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

