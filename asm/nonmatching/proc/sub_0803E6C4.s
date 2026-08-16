	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E6C4
sub_0803E6C4: @ 0x0803E6C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r2, #0
	mov sl, r0
	adds r2, r1, #3
	ldr r1, _0803E754 @ =gUnknown_080912FC
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r2, r0
	bge _0803E744
	lsls r3, r3, #0x10
	mov sb, r3
_0803E6E4:
	movs r5, #0
	lsls r7, r2, #1
	adds r0, r2, #1
	mov r8, r0
	lsls r6, r2, #0x10
_0803E6EE:
	ldr r0, _0803E758 @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r2, _0803E75C @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r7
	ldrh r0, [r0]
	mov r2, sl
	adds r4, r2, r5
	adds r0, r0, r4
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E732
	adds r3, r0, #0
	asrs r1, r3, #6
	ldr r0, _0803E760 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #5
	beq _0803E732
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	adds r2, r3, #0
	lsrs r1, r6, #0x10
	mov r4, sb
	lsrs r3, r4, #0x10
	bl sub_0803E560
_0803E732:
	adds r5, #1
	cmp r5, #2
	ble _0803E6EE
	mov r2, r8
	ldr r0, _0803E758 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _0803E6E4
_0803E744:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E754: .4byte gUnknown_080912FC
_0803E758: .4byte gUnknown_08499590
_0803E75C: .4byte 0x0000417A
_0803E760: .4byte gUnknown_08499598

