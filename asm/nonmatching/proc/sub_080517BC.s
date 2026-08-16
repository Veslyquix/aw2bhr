	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080517BC
sub_080517BC: @ 0x080517BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08051830 @ =gUnknown_081360FC
	ldr r2, [r0]
	ldr r3, _08051834 @ =gUnknown_08136100
	ldr r0, [r3]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r2, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r6, [r0]
	adds r2, #0x34
	adds r1, r1, r2
	ldrh r1, [r1]
	mov r8, r1
	ldr r2, _08051838 @ =gUnknown_08136104
	ldr r7, [r2]
	lsls r1, r1, #1
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r5, r0, #4
	adds r4, r1, r5
	adds r0, r7, #0
	adds r0, #0x80
	adds r0, r4, r0
	adds r1, r5, r7
	adds r1, #0x8a
	ldrh r0, [r0]
	mov sl, r3
	mov sb, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _0805186A
	ldr r2, _0805183C @ =gUnknown_085D6A48
	ldr r0, _08051840 @ =gUnknown_03004580
	lsls r1, r6, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _08051844
	adds r0, r7, #0
	adds r0, #0x26
	adds r0, r4, r0
	b _08051856
	.align 2, 0
_08051830: .4byte gUnknown_081360FC
_08051834: .4byte gUnknown_08136100
_08051838: .4byte gUnknown_08136104
_0805183C: .4byte gUnknown_085D6A48
_08051840: .4byte gUnknown_03004580
_08051844:
	ldr r1, _08051914 @ =gUnknown_08552148
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	adds r1, r7, #0
	adds r1, #0x26
	adds r0, r0, r1
_08051856:
	movs r1, #1
	strh r1, [r0]
	mov r4, sl
	ldr r0, [r4]
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	mov r1, r8
	bl sub_08051920
_0805186A:
	mov r4, sb
	ldr r2, [r4]
	mov r0, r8
	lsls r3, r0, #1
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r1, r2, #0
	adds r1, #0x80
	adds r1, r3, r1
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r1, r2, #0
	adds r1, #0x58
	adds r1, r3, r1
	adds r0, r2, #0
	adds r0, #0x62
	adds r0, r3, r0
	ldrh r0, [r0]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	ldr r1, _08051918 @ =gUnknown_02029924
	adds r1, r3, r1
	str r1, [sp]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	adds r1, r2, #0
	adds r1, #0x6c
	adds r1, r3, r1
	adds r0, r2, #0
	adds r0, #0x76
	adds r0, r3, r0
	ldrh r0, [r0]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	adds r1, r2, #0
	adds r1, #0x4e
	adds r3, r3, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	ldr r2, _0805191C @ =gUnknown_03001470
	mov r4, sl
	ldr r5, [r4]
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r2, #0x28
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r4, [sp]
	ldrh r2, [r4]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	ldrsh r3, [r3, r0]
	adds r0, r6, #0
	bl sub_08050528
	movs r1, #0
	ldrsh r2, [r5, r1]
	adds r0, r6, #0
	mov r1, r8
	bl sub_080513FC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051914: .4byte gUnknown_08552148
_08051918: .4byte gUnknown_02029924
_0805191C: .4byte gUnknown_03001470

