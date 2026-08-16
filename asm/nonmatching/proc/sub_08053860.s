	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053860
sub_08053860: @ 0x08053860
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r1, _08053B9C @ =gUnknown_08551E7C
	ldr r4, _08053BA0 @ =gUnknown_0300450C
	ldrh r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_0805741C
	ldr r6, _08053BA4 @ =gUnknown_02029A10
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	ldr r5, _08053BA8 @ =gUnknown_085523A8
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #0x3c
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0x60
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0x84
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0xa8
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0xcc
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldrh r1, [r4]
	movs r2, #1
	mov r8, r2
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0xf0
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	ldr r6, _08053BAC @ =gUnknown_02029668
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #2
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #4
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #6
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #8
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	ldr r6, _08053BB0 @ =gUnknown_02029808
	movs r1, #0x24
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #0x26
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x28
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0x90
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0x92
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0x94
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0x96
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	adds r0, r6, #0
	adds r0, #0x98
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	ldr r6, _08053BB4 @ =gUnknown_020296B0
	movs r1, #2
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #4
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #6
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #8
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl sub_08053614
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	ldrh r1, [r4]
	mov r2, r8
	eors r2, r1
	lsls r2, r2, #1
	mov r8, r2
	add r8, r5
	mov r2, r8
	ldrh r1, [r2]
	bl sub_08053614
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053B9C: .4byte gUnknown_08551E7C
_08053BA0: .4byte gUnknown_0300450C
_08053BA4: .4byte gUnknown_02029A10
_08053BA8: .4byte gUnknown_085523A8
_08053BAC: .4byte gUnknown_02029668
_08053BB0: .4byte gUnknown_02029808
_08053BB4: .4byte gUnknown_020296B0

