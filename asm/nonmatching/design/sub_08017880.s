	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017880
sub_08017880: @ 0x08017880
	push {r4, r5, lr}
	ldr r0, _08017928 @ =0x04000006
	ldrh r0, [r0]
	movs r4, #0xff
	ands r4, r0
	ldr r5, _0801792C @ =gUnknown_030030A8
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x2f
	subs r0, r0, r1
	cmp r4, r0
	bne _080178D2
	ldr r1, _08017930 @ =0x04000008
	ldr r0, _08017934 @ =gUnknown_03002010
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #8
	ldr r0, _08017938 @ =gUnknown_03003030
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	ldr r0, _0801793C @ =gUnknown_03002B3C
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #0x3c
	ldr r0, _08017940 @ =gUnknown_03002014
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08017944 @ =0x04000052
	ldr r2, _08017948 @ =gUnknown_030030C0
	ldr r0, _0801794C @ =gUnknown_03001FEC
	ldrh r1, [r0]
	lsls r1, r1, #8
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r3]
	ldr r1, _08017950 @ =0x04000054
	ldr r0, _08017954 @ =gUnknown_03001FB4
	ldrh r0, [r0]
	strh r0, [r1]
_080178D2:
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x2c
	subs r0, r0, r1
	cmp r4, r0
	bne _080178EA
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldr r1, _08017958 @ =gUnknown_03002F38
	ldrh r1, [r1]
	strh r1, [r0]
_080178EA:
	cmp r4, #0xe2
	bne _08017922
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _0801795C @ =gUnknown_03002EDC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #8
	ldr r0, _08017960 @ =gUnknown_03002030
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #0xa
	ldrh r0, [r5]
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r0, _08017964 @ =0x04000050
	movs r1, #0
	str r1, [r0]
	ldr r2, _08017950 @ =0x04000054
	ldr r0, _08017968 @ =gUnknown_03001424
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, _0801796C @ =0x04000010
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_08017922:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08017928: .4byte 0x04000006
_0801792C: .4byte gUnknown_030030A8
_08017930: .4byte 0x04000008
_08017934: .4byte gUnknown_03002010
_08017938: .4byte gUnknown_03003030
_0801793C: .4byte gUnknown_03002B3C
_08017940: .4byte gUnknown_03002014
_08017944: .4byte 0x04000052
_08017948: .4byte gUnknown_030030C0
_0801794C: .4byte gUnknown_03001FEC
_08017950: .4byte 0x04000054
_08017954: .4byte gUnknown_03001FB4
_08017958: .4byte gUnknown_03002F38
_0801795C: .4byte gUnknown_03002EDC
_08017960: .4byte gUnknown_03002030
_08017964: .4byte 0x04000050
_08017968: .4byte gUnknown_03001424
_0801796C: .4byte 0x04000010

