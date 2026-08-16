	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E764
sub_0803E764: @ 0x0803E764
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldrh r0, [r4]
	ldr r2, _0803E7B4 @ =0x0000FFFF
	cmp r0, r2
	beq _0803E7AA
	mov r8, r2
	lsls r6, r1, #0x10
_0803E778:
	ldrh r3, [r4]
	ldrh r5, [r4, #2]
	ldr r0, _0803E7B8 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r7, _0803E7BC @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r3
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E7A2
	adds r2, r0, #0
	adds r0, r3, #0
	adds r1, r5, #0
	lsrs r3, r6, #0x10
	bl sub_0803E560
_0803E7A2:
	adds r4, #4
	ldrh r0, [r4]
	cmp r0, r8
	bne _0803E778
_0803E7AA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E7B4: .4byte 0x0000FFFF
_0803E7B8: .4byte gUnknown_08499590
_0803E7BC: .4byte 0x0000417A

