	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075F44
sub_08075F44: @ 0x08075F44
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r2, _08075F78 @ =gUnknown_081CC584
	ldr r0, [r2]
	movs r3, #4
	ldrsh r1, [r0, r3]
	movs r5, #0
	ldrsh r0, [r0, r5]
	adds r0, r1, r0
	cmp r0, #0
	bge _08075F64
	adds r0, #7
_08075F64:
	asrs r0, r0, #3
	cmp r0, #0x1f
	ble _08075F80
	ldr r0, _08075F7C @ =gUnknown_08614280
	ldr r0, [r0]
	movs r1, #0xf8
	lsls r1, r1, #3
	adds r4, r0, r1
	b _08075F84
	.align 2, 0
_08075F78: .4byte gUnknown_081CC584
_08075F7C: .4byte gUnknown_08614280
_08075F80:
	ldr r0, _08076044 @ =gUnknown_08614280
	ldr r4, [r0]
_08075F84:
	ldr r2, [r2]
	movs r3, #4
	ldrsh r1, [r2, r3]
	movs r5, #0
	ldrsh r0, [r2, r5]
	adds r0, r1, r0
	cmp r0, #0
	bge _08075F96
	adds r0, #7
_08075F96:
	asrs r3, r0, #3
	movs r0, #6
	ldrsh r1, [r2, r0]
	movs r5, #2
	ldrsh r0, [r2, r5]
	adds r0, r1, r0
	cmp r0, #0
	bge _08075FA8
	adds r0, #7
_08075FA8:
	asrs r0, r0, #3
	lsls r0, r0, #5
	adds r0, r3, r0
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsrs r5, r0, #0xc
	ldr r0, [r6, #0x3c]
	cmp r5, r0
	beq _08076036
	str r5, [r6, #0x3c]
	movs r6, #0
	str r6, [sp, #8]
	ldr r0, _08076048 @ =gUnknown_08551A00
	mov sb, r0
	ldr r1, [r0]
	movs r2, #0xa0
	lsls r2, r2, #2
	mov r8, r2
	add r1, r8
	ldr r2, _0807604C @ =0x01000040
	add r0, sp, #8
	bl CpuFastSet
	ldr r0, _08076050 @ =gUnknown_081CC4F8
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r4, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl sub_0802D5CC
	ldr r0, _08076054 @ =gUnknown_08551A04
	ldr r0, [r0]
	add r0, r8
	ldr r1, _08076058 @ =gUnknown_081D22C4
	movs r2, #0xd8
	lsls r2, r2, #2
	bl sub_080718F8
	bl sub_080135A4
	movs r0, #0xd0
	lsls r0, r0, #2
	bl sub_0801B780
	mov r3, sb
	ldr r2, [r3]
	ldr r1, _0807605C @ =gUnknown_08610A38
	ldr r0, _08076060 @ =gUnknown_081CC578
	lsls r4, r4, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r6, [sp]
	str r6, [sp, #4]
	movs r0, #3
	movs r1, #0xb
	bl sub_080149C0
	ldr r0, _08076064 @ =gUnknown_081CC538
	adds r5, r5, r0
	ldr r0, [r5]
	mov r5, sb
	ldr r1, [r5]
	ldr r2, _08076068 @ =0x000002C2
	adds r1, r1, r2
	bl sub_0801F2AC
_08076036:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076044: .4byte gUnknown_08614280
_08076048: .4byte gUnknown_08551A00
_0807604C: .4byte 0x01000040
_08076050: .4byte gUnknown_081CC4F8
_08076054: .4byte gUnknown_08551A04
_08076058: .4byte gUnknown_081D22C4
_0807605C: .4byte gUnknown_08610A38
_08076060: .4byte gUnknown_081CC578
_08076064: .4byte gUnknown_081CC538
_08076068: .4byte 0x000002C2

