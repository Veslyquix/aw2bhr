	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043CA0
sub_08043CA0: @ 0x08043CA0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	movs r5, #0
	ldr r0, _08043CF8 @ =gUnknown_08091378
	mov r8, r0
	ldr r1, _08043CFC @ =gUnknown_0809137C
	mov sb, r1
	ldr r7, [r1]
_08043CB6:
	mov r1, r8
	ldr r0, [r1]
	adds r4, r5, r0
	ldrb r0, [r4]
	bl sub_0803CAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043CD6
	adds r0, r6, #0
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	adds r0, r0, r7
	ldrb r1, [r4]
	strb r1, [r0]
_08043CD6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x12
	bls _08043CB6
	mov r1, sb
	ldr r0, [r1]
	adds r0, r6, r0
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043CF8: .4byte gUnknown_08091378
_08043CFC: .4byte gUnknown_0809137C

