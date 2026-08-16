	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080257C0
sub_080257C0: @ 0x080257C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080258A8 @ =gUnknown_08499594
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, [r2]
	adds r3, r2, r1
	movs r6, #0
	ldrb r0, [r3, #2]
	mov r8, r0
	ldrb r4, [r3, #3]
	cmp r3, #0
	beq _080258C0
	ldrb r1, [r3, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080258C0
	subs r1, r3, r2
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0xe
	asrs r0, r0, #0x10
	bl sub_08026F5C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080258C0
	ldr r1, _080258AC @ =gUnknown_084995FE
	ldr r0, _080258B0 @ =gUnknown_030033EC
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r7, _080258B4 @ =gUnknown_08499590
	ldr r2, [r7]
	adds r5, r4, #0
	lsls r3, r5, #1
	ldr r4, _080258B8 @ =0x0000417A
	adds r1, r2, r4
	adds r1, r1, r3
	ldrh r1, [r1]
	mov r4, r8
	adds r1, r1, r4
	ldr r3, _080258BC @ =0x00001432
	adds r2, r2, r3
	adds r2, r2, r1
	ldrb r1, [r2]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080258C0
	cmp r4, #0
	ble _08025852
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_08025744
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08025852:
	cmp r5, #0
	ble _08025868
	subs r1, r5, #1
	adds r0, r4, #0
	bl sub_08025744
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08025868:
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08025884
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_08025744
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08025884:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _080258A0
	adds r1, r5, #1
	adds r0, r4, #0
	bl sub_08025744
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080258A0:
	cmp r6, #0
	bne _080258C0
	movs r0, #0
	b _080258C2
	.align 2, 0
_080258A8: .4byte gUnknown_08499594
_080258AC: .4byte gUnknown_084995FE
_080258B0: .4byte gUnknown_030033EC
_080258B4: .4byte gUnknown_08499590
_080258B8: .4byte 0x0000417A
_080258BC: .4byte 0x00001432
_080258C0:
	movs r0, #1
_080258C2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

