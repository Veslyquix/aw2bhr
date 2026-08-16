	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039ACC
sub_08039ACC: @ 0x08039ACC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r1, _08039B08 @ =gUnknown_08090F6C
	ldr r2, [r1]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	adds r7, r1, #0
	cmp r0, #1
	ble _08039AFE
	movs r0, #0
	str r0, [r2]
_08039AFE:
	cmp r6, #0
	beq _08039B10
	ldr r0, _08039B0C @ =gUnknown_0849D874
	b _08039B12
	.align 2, 0
_08039B08: .4byte gUnknown_08090F6C
_08039B0C: .4byte gUnknown_0849D874
_08039B10:
	ldr r0, _08039B78 @ =gUnknown_0849D84C
_08039B12:
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	ldr r4, _08039B7C @ =gUnknown_084A0090
	ldr r0, [r7]
	ldr r2, [r0]
	lsls r2, r2, #1
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, _08039B80 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08039B84 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r4, #0x2c
	adds r2, r2, r4
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl sub_0803B4DC
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	mov r2, sb
	strb r2, [r1]
	adds r1, #1
	mov r2, sl
	strb r2, [r1]
	mov r1, r8
	strh r1, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r0, [r5, #0x30]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039B78: .4byte gUnknown_0849D84C
_08039B7C: .4byte gUnknown_084A0090
_08039B80: .4byte gUnknown_030033EC
_08039B84: .4byte gUnknown_08499598

